/*
 * Copyright (C) 2019-2020 Apple Inc. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "RemoteAudioSourceProviderProxy.h"

#if ENABLE(GPU_PROCESS) && ENABLE(WEB_AUDIO) && PLATFORM(COCOA)

#include "RemoteAudioSourceProviderManagerMessages.h"
#include <WebCore/AudioSourceProviderAVFObjC.h>

namespace WebKit {

Ref<RemoteAudioSourceProviderProxy> RemoteAudioSourceProviderProxy::create(WebCore::MediaPlayerIdentifier identifier, Ref<IPC::Connection>&& connection, WebCore::AudioSourceProviderAVFObjC& localProvider)
{
    auto remoteProvider = adoptRef(*new RemoteAudioSourceProviderProxy(identifier, WTFMove(connection)));

    localProvider.setRingBufferCreationCallback([remoteProvider]() {
        return remoteProvider->createRingBuffer();
    });
    localProvider.setAudioCallback([remoteProvider](auto startFrame, auto numberOfFrames) {
        remoteProvider->newAudioSamples(startFrame, numberOfFrames);
    });

    return remoteProvider;
}

RemoteAudioSourceProviderProxy::RemoteAudioSourceProviderProxy(WebCore::MediaPlayerIdentifier identifier, Ref<IPC::Connection>&& connection)
    : m_identifier(identifier)
    , m_connection(WTFMove(connection))
{
}

RemoteAudioSourceProviderProxy::~RemoteAudioSourceProviderProxy() = default;

UniqueRef<WebCore::CARingBuffer> RemoteAudioSourceProviderProxy::createRingBuffer()
{
    return makeUniqueRef<ProducerSharedCARingBuffer>([protectedThis = Ref { *this }](SharedMemory* memory, const WebCore::CAAudioStreamDescription& format, size_t frameCount) mutable {
        protectedThis->storageChanged(memory, format, frameCount);
    });
}

void RemoteAudioSourceProviderProxy::newAudioSamples(uint64_t startFrame, uint64_t numberOfFrames)
{
    m_connection->send(Messages::RemoteAudioSourceProviderManager::AudioSamplesAvailable { m_identifier, startFrame, numberOfFrames }, 0);
}

void RemoteAudioSourceProviderProxy::storageChanged(SharedMemory* memory, const WebCore::CAAudioStreamDescription& format, size_t frameCount)
{
    SharedMemory::Handle handle;
    if (memory)
        memory->createHandle(handle, SharedMemory::Protection::ReadOnly);
    m_connection->send(Messages::RemoteAudioSourceProviderManager::AudioStorageChanged { m_identifier, handle, format, frameCount }, 0);
}

} // namespace WebKit

#endif // ENABLE(GPU_PROCESS) && ENABLE(WEB_AUDIO) && PLATFORM(COCOA)
