cmake_minimum_required(VERSION 3.12)

include(WebKitCommon)
include(target/TargetWTF)
include(WebCoreMacros.cmake)
include(Headers.cmake)

set_property(DIRECTORY . PROPERTY FOLDER "WebCore")

add_subdirectory(PAL/pal)

list(APPEND WebCore_UNIFIED_SOURCE_LIST_FILES
    "Sources.txt"
)

set(WebCore_PRIVATE_INCLUDE_DIRECTORIES
    "${CMAKE_BINARY_DIR}"
    "${WebCore_DERIVED_SOURCES_DIR}"
    "${WEBCORE_DIR}"
    "${WEBCORE_DIR}/Modules/WebGPU"
    "${WEBCORE_DIR}/Modules/encryptedmedia"
    "${WEBCORE_DIR}/Modules/encryptedmedia/legacy"
    "${WEBCORE_DIR}/Modules/mediacapabilities"
    "${WEBCORE_DIR}/Modules/mediacontrols"
    "${WEBCORE_DIR}/Modules/mediarecorder"
    "${WEBCORE_DIR}/Modules/mediasession"
    "${WEBCORE_DIR}/Modules/mediasource"
    "${WEBCORE_DIR}/Modules/mediastream"
    "${WEBCORE_DIR}/Modules/mediastream/libwebrtc"
    "${WEBCORE_DIR}/Modules/model-element"
    "${WEBCORE_DIR}/Modules/storage"
    "${WEBCORE_DIR}/Modules/streams"
    "${WEBCORE_DIR}/Modules/web-locks"
    "${WEBCORE_DIR}/Modules/webaudio"
    "${WEBCORE_DIR}/Modules/webcodecs"
    "${WEBCORE_DIR}/accessibility"
    "${WEBCORE_DIR}/accessibility/isolatedtree"
    "${WEBCORE_DIR}/animation"
    "${WEBCORE_DIR}/bridge"
    "${WEBCORE_DIR}/bridge/c"
    "${WEBCORE_DIR}/contentextensions"
    "${WEBCORE_DIR}/crypto"
    "${WEBCORE_DIR}/crypto/algorithms"
    "${WEBCORE_DIR}/crypto/keys"
    "${WEBCORE_DIR}/crypto/parameters"
    "${WEBCORE_DIR}/css"
    "${WEBCORE_DIR}/css/calc"
    "${WEBCORE_DIR}/css/parser"
    "${WEBCORE_DIR}/css/query"
    "${WEBCORE_DIR}/css/typedom"
    "${WEBCORE_DIR}/css/typedom/color"
    "${WEBCORE_DIR}/css/typedom/numeric"
    "${WEBCORE_DIR}/css/typedom/transform"
    "${WEBCORE_DIR}/display"
    "${WEBCORE_DIR}/display/compositing"
    "${WEBCORE_DIR}/display/css"
    "${WEBCORE_DIR}/dom"
    "${WEBCORE_DIR}/dom/messageports"
    "${WEBCORE_DIR}/editing"
    "${WEBCORE_DIR}/fileapi"
    "${WEBCORE_DIR}/history"
    "${WEBCORE_DIR}/html"
    "${WEBCORE_DIR}/html/canvas"
    "${WEBCORE_DIR}/html/forms"
    "${WEBCORE_DIR}/html/parser"
    "${WEBCORE_DIR}/html/shadow"
    "${WEBCORE_DIR}/html/track"
    "${WEBCORE_DIR}/inspector"
    "${WEBCORE_DIR}/inspector/agents"
    "${WEBCORE_DIR}/inspector/agents/page"
    "${WEBCORE_DIR}/inspector/agents/worker"
    "${WEBCORE_DIR}/layout"
    "${WEBCORE_DIR}/layout/formattingContexts"
    "${WEBCORE_DIR}/layout/formattingContexts/block"
    "${WEBCORE_DIR}/layout/formattingContexts/block/tablewrapper"
    "${WEBCORE_DIR}/layout/formattingContexts/flex"
    "${WEBCORE_DIR}/layout/floats"
    "${WEBCORE_DIR}/layout/formattingContexts/inline"
    "${WEBCORE_DIR}/layout/formattingContexts/inline/display"
    "${WEBCORE_DIR}/layout/formattingContexts/inline/invalidation"
    "${WEBCORE_DIR}/layout/formattingContexts/inline/text"
    "${WEBCORE_DIR}/layout/integration"
    "${WEBCORE_DIR}/layout/integration/flex"
    "${WEBCORE_DIR}/layout/integration/inline"
    "${WEBCORE_DIR}/layout/layouttree"
    "${WEBCORE_DIR}/layout/formattingContexts/table"
    "${WEBCORE_DIR}/loader"
    "${WEBCORE_DIR}/loader/appcache"
    "${WEBCORE_DIR}/loader/archive"
    "${WEBCORE_DIR}/loader/archive/mhtml"
    "${WEBCORE_DIR}/loader/cache"
    "${WEBCORE_DIR}/loader/icon"
    "${WEBCORE_DIR}/mathml"
    "${WEBCORE_DIR}/page"
    "${WEBCORE_DIR}/page/csp"
    "${WEBCORE_DIR}/page/scrolling"
    "${WEBCORE_DIR}/platform"
    "${WEBCORE_DIR}/platform/animation"
    "${WEBCORE_DIR}/platform/audio"
    "${WEBCORE_DIR}/platform/calc"
    "${WEBCORE_DIR}/platform/encryptedmedia"
    "${WEBCORE_DIR}/platform/gamepad"
    "${WEBCORE_DIR}/platform/graphics"
    "${WEBCORE_DIR}/platform/graphics/cpu/arm"
    "${WEBCORE_DIR}/platform/graphics/cpu/arm/filters"
    "${WEBCORE_DIR}/platform/graphics/displaylists"
    "${WEBCORE_DIR}/platform/graphics/filters"
    "${WEBCORE_DIR}/platform/graphics/filters/software"
    "${WEBCORE_DIR}/platform/graphics/iso"
    "${WEBCORE_DIR}/platform/graphics/opentype"
    "${WEBCORE_DIR}/platform/graphics/transforms"
    "${WEBCORE_DIR}/platform/mediacapabilities"
    "${WEBCORE_DIR}/platform/mediarecorder"
    "${WEBCORE_DIR}/platform/mediastream"
    "${WEBCORE_DIR}/platform/mediastream/libwebrtc"
    "${WEBCORE_DIR}/platform/mediarecorder"
    "${WEBCORE_DIR}/platform/mock"
    "${WEBCORE_DIR}/platform/mock/mediasource"
    "${WEBCORE_DIR}/platform/network"
    "${WEBCORE_DIR}/platform/sql"
    "${WEBCORE_DIR}/platform/text"
    "${WEBCORE_DIR}/platform/xr"
    "${WEBCORE_DIR}/rendering"
    "${WEBCORE_DIR}/rendering/line"
    "${WEBCORE_DIR}/rendering/mathml"
    "${WEBCORE_DIR}/rendering/shapes"
    "${WEBCORE_DIR}/rendering/style"
    "${WEBCORE_DIR}/rendering/svg"
    "${WEBCORE_DIR}/rendering/updating"
    "${WEBCORE_DIR}/replay"
    "${WEBCORE_DIR}/storage"
    "${WEBCORE_DIR}/style"
    "${WEBCORE_DIR}/svg"
    "${WEBCORE_DIR}/svg/animation"
    "${WEBCORE_DIR}/svg/graphics"
    "${WEBCORE_DIR}/svg/graphics/filters"
    "${WEBCORE_DIR}/svg/properties"
    "${WEBCORE_DIR}/websockets"
    "${WEBCORE_DIR}/worklets"
    "${WEBCORE_DIR}/xml"
    "${WEBCORE_DIR}/xml/parser"
)

set(WebCore_IDL_INCLUDES
    css
    dom
    fileapi
    html
    inspector
    loader
    page
    storage
    svg
    xml

    Modules/WebGPU
    Modules/encryptedmedia/legacy
    Modules/mediacapabilities
    Modules/mediarecorder
    Modules/mediastream
    Modules/model-element
    Modules/storage
    Modules/streams
    Modules/webaudio

    css/typedom

    css/typedom/color
    css/typedom/numeric
    css/typedom/transform

    html/canvas
    html/shadow
    html/track

    loader/appcache
)

set(WebCore_NON_SVG_IDL_FILES
    Modules/encryptedmedia/MediaKeyEncryptionScheme.idl
    Modules/encryptedmedia/MediaKeyMessageEventInit.idl
    Modules/encryptedmedia/MediaKeyMessageEvent.idl
    Modules/encryptedmedia/MediaKeyMessageType.idl
    Modules/encryptedmedia/MediaKeySession.idl
    Modules/encryptedmedia/MediaKeySessionType.idl
    Modules/encryptedmedia/MediaKeyStatusMap.idl
    Modules/encryptedmedia/MediaKeySystemAccess.idl
    Modules/encryptedmedia/MediaKeySystemConfiguration.idl
    Modules/encryptedmedia/MediaKeySystemMediaCapability.idl
    Modules/encryptedmedia/MediaKeys.idl
    Modules/encryptedmedia/MediaKeysRequirement.idl
    Modules/encryptedmedia/Navigator+EME.idl

    Modules/mediacapabilities/AudioConfiguration.idl
    Modules/mediacapabilities/ColorGamut.idl
    Modules/mediacapabilities/HdrMetadataType.idl
    Modules/mediacapabilities/MediaCapabilities.idl
    Modules/mediacapabilities/MediaCapabilitiesDecodingInfo.idl
    Modules/mediacapabilities/MediaCapabilitiesEncodingInfo.idl
    Modules/mediacapabilities/MediaCapabilitiesInfo.idl
    Modules/mediacapabilities/MediaConfiguration.idl
    Modules/mediacapabilities/MediaDecodingConfiguration.idl
    Modules/mediacapabilities/MediaDecodingType.idl
    Modules/mediacapabilities/MediaEncodingConfiguration.idl
    Modules/mediacapabilities/MediaEncodingType.idl
    Modules/mediacapabilities/Navigator+MediaCapabilities.idl
    Modules/mediacapabilities/TransferFunction.idl
    Modules/mediacapabilities/VideoConfiguration.idl
    Modules/mediacapabilities/WorkerNavigator+MediaCapabilities.idl

    Modules/mediacontrols/MediaControlsHost.idl

    Modules/mediarecorder/BlobEvent.idl
    Modules/mediarecorder/MediaRecorder.idl
    Modules/mediarecorder/MediaRecorderErrorEvent.idl

    Modules/mediasession/MediaImage.idl
    Modules/mediasession/MediaMetadata.idl
    Modules/mediasession/MediaMetadataInit.idl
    Modules/mediasession/MediaMetadataPlaylistMixin.idl
    Modules/mediasession/MediaPositionState.idl
    Modules/mediasession/MediaSession.idl
    Modules/mediasession/MediaSessionAction.idl
    Modules/mediasession/MediaSessionActionDetails.idl
    Modules/mediasession/MediaSessionActionHandler.idl
    Modules/mediasession/MediaSessionCoordinator.idl
    Modules/mediasession/MediaSessionCoordinatorMixin.idl
    Modules/mediasession/MediaSessionCoordinatorState.idl
    Modules/mediasession/MediaSessionPlaybackState.idl
    Modules/mediasession/MediaSessionPlaylistMixin.idl
    Modules/mediasession/MediaSessionReadyState.idl
    Modules/mediasession/Navigator+MediaSession.idl

    Modules/mediasource/AudioTrack+MediaSource.idl
    Modules/mediasource/DOMURL+MediaSource.idl
    Modules/mediasource/MediaSource.idl
    Modules/mediasource/SourceBuffer.idl
    Modules/mediasource/SourceBufferList.idl
    Modules/mediasource/TextTrack+MediaSource.idl
    Modules/mediasource/VideoPlaybackQuality.idl
    Modules/mediasource/VideoTrack+MediaSource.idl

    Modules/mediastream/CanvasCaptureMediaStreamTrack.idl
    Modules/mediastream/DoubleRange.idl
    Modules/mediastream/LongRange.idl
    Modules/mediastream/MediaDeviceInfo.idl
    Modules/mediastream/MediaDevices.idl
    Modules/mediastream/MediaStream.idl
    Modules/mediastream/MediaStreamTrack.idl
    Modules/mediastream/MediaStreamTrackEvent.idl
    Modules/mediastream/MediaTrackConstraints.idl
    Modules/mediastream/MediaTrackSupportedConstraints.idl
    Modules/mediastream/Navigator+MediaDevices.idl
    Modules/mediastream/OverconstrainedError.idl
    Modules/mediastream/OverconstrainedErrorEvent.idl
    Modules/mediastream/RTCAnswerOptions.idl
    Modules/mediastream/RTCCertificate.idl
    Modules/mediastream/RTCConfiguration.idl
    Modules/mediastream/RTCDTMFSender.idl
    Modules/mediastream/RTCDTMFToneChangeEvent.idl
    Modules/mediastream/RTCDataChannel.idl
    Modules/mediastream/RTCDataChannelEvent.idl
    Modules/mediastream/RTCDegradationPreference.idl
    Modules/mediastream/RTCDtlsTransport.idl
    Modules/mediastream/RTCDtlsTransportState.idl
    Modules/mediastream/RTCDtxStatus.idl
    Modules/mediastream/RTCEncodedAudioFrame.idl
    Modules/mediastream/RTCEncodedVideoFrame.idl
    Modules/mediastream/RTCError.idl
    Modules/mediastream/RTCErrorDetailType.idl
    Modules/mediastream/RTCErrorEvent.idl
    Modules/mediastream/RTCIceCandidate.idl
    Modules/mediastream/RTCIceCandidateInit.idl
    Modules/mediastream/RTCIceCandidateType.idl
    Modules/mediastream/RTCIceComponent.idl
    Modules/mediastream/RTCIceConnectionState.idl
    Modules/mediastream/RTCIceGatheringState.idl
    Modules/mediastream/RTCIceProtocol.idl
    Modules/mediastream/RTCIceServer.idl
    Modules/mediastream/RTCIceTcpCandidateType.idl
    Modules/mediastream/RTCIceTransport.idl
    Modules/mediastream/RTCIceTransportState.idl
    Modules/mediastream/RTCLocalSessionDescriptionInit.idl
    Modules/mediastream/RTCOfferAnswerOptions.idl
    Modules/mediastream/RTCOfferOptions.idl
    Modules/mediastream/RTCPeerConnection.idl
    Modules/mediastream/RTCPeerConnectionIceErrorEvent.idl
    Modules/mediastream/RTCPeerConnectionIceEvent.idl
    Modules/mediastream/RTCPeerConnectionState.idl
    Modules/mediastream/RTCPriorityType.idl
    Modules/mediastream/RTCRtcpParameters.idl
    Modules/mediastream/RTCRtpCapabilities.idl
    Modules/mediastream/RTCRtpCodecCapability.idl
    Modules/mediastream/RTCRtpCodecParameters.idl
    Modules/mediastream/RTCRtpCodingParameters.idl
    Modules/mediastream/RTCRtpContributingSource.idl
    Modules/mediastream/RTCRtpEncodingParameters.idl
    Modules/mediastream/RTCRtpFecParameters.idl
    Modules/mediastream/RTCRtpHeaderExtensionParameters.idl
    Modules/mediastream/RTCRtpParameters.idl
    Modules/mediastream/RTCRtpReceiver+Transform.idl
    Modules/mediastream/RTCRtpReceiver.idl
    Modules/mediastream/RTCRtpRtxParameters.idl
    Modules/mediastream/RTCRtpSFrameTransform.idl
    Modules/mediastream/RTCRtpSFrameTransformErrorEvent.idl
    Modules/mediastream/RTCRtpScriptTransform.idl
    Modules/mediastream/RTCRtpScriptTransformProvider.idl
    Modules/mediastream/RTCRtpScriptTransformer.idl
    Modules/mediastream/RTCRtpSendParameters.idl
    Modules/mediastream/RTCRtpSender+Transform.idl
    Modules/mediastream/RTCRtpSender.idl
    Modules/mediastream/RTCRtpSynchronizationSource.idl
    Modules/mediastream/RTCRtpTransceiver.idl
    Modules/mediastream/RTCRtpTransceiverDirection.idl
    Modules/mediastream/RTCSctpTransport.idl
    Modules/mediastream/RTCSctpTransportState.idl
    Modules/mediastream/RTCSdpType.idl
    Modules/mediastream/RTCSessionDescription.idl
    Modules/mediastream/RTCSessionDescriptionInit.idl
    Modules/mediastream/RTCSignalingState.idl
    Modules/mediastream/RTCStatsReport.idl
    Modules/mediastream/RTCTrackEvent.idl
    Modules/mediastream/RTCTransformEvent.idl

    Modules/model-element/HTMLModelElement.idl
    Modules/model-element/HTMLModelElementCamera.idl

    Modules/storage/StorageManager.idl

    Modules/streams/ByteLengthQueuingStrategy.idl
    Modules/streams/CountQueuingStrategy.idl
    Modules/streams/GenericTransformStream.idl
    Modules/streams/ReadableByteStreamController.idl
    Modules/streams/ReadableStream.idl
    Modules/streams/ReadableStreamBYOBReader.idl
    Modules/streams/ReadableStreamBYOBRequest.idl
    Modules/streams/ReadableStreamDefaultController.idl
    Modules/streams/ReadableStreamDefaultReader.idl
    Modules/streams/ReadableStreamSink.idl
    Modules/streams/ReadableStreamSource.idl
    Modules/streams/TransformStream.idl
    Modules/streams/TransformStreamDefaultController.idl
    Modules/streams/WritableStream.idl
    Modules/streams/WritableStreamDefaultController.idl
    Modules/streams/WritableStreamDefaultWriter.idl
    Modules/streams/WritableStreamSink.idl

    Modules/webaudio/AnalyserNode.idl
    Modules/webaudio/AnalyserOptions.idl
    Modules/webaudio/AudioBuffer.idl
    Modules/webaudio/AudioBufferCallback.idl
    Modules/webaudio/AudioBufferOptions.idl
    Modules/webaudio/AudioBufferSourceNode.idl
    Modules/webaudio/AudioBufferSourceOptions.idl
    Modules/webaudio/AudioContext.idl
    Modules/webaudio/AudioContextLatencyCategory.idl
    Modules/webaudio/AudioContextOptions.idl
    Modules/webaudio/AudioContextState.idl
    Modules/webaudio/AudioDestinationNode.idl
    Modules/webaudio/AudioListener.idl
    Modules/webaudio/AudioNode.idl
    Modules/webaudio/AudioNodeOptions.idl
    Modules/webaudio/AudioParam.idl
    Modules/webaudio/AudioParamDescriptor.idl
    Modules/webaudio/AudioParamMap.idl
    Modules/webaudio/AudioProcessingEvent.idl
    Modules/webaudio/AudioProcessingEventInit.idl
    Modules/webaudio/AudioScheduledSourceNode.idl
    Modules/webaudio/AudioTimestamp.idl
    Modules/webaudio/AudioWorklet.idl
    Modules/webaudio/AudioWorkletGlobalScope.idl
    Modules/webaudio/AudioWorkletNode.idl
    Modules/webaudio/AudioWorkletNodeOptions.idl
    Modules/webaudio/AudioWorkletProcessor.idl
    Modules/webaudio/AudioWorkletProcessorConstructor.idl
    Modules/webaudio/AutomationRate.idl
    Modules/webaudio/BaseAudioContext.idl
    Modules/webaudio/BiquadFilterNode.idl
    Modules/webaudio/BiquadFilterOptions.idl
    Modules/webaudio/BiquadFilterType.idl
    Modules/webaudio/ChannelCountMode.idl
    Modules/webaudio/ChannelInterpretation.idl
    Modules/webaudio/ChannelMergerNode.idl
    Modules/webaudio/ChannelMergerOptions.idl
    Modules/webaudio/ChannelSplitterNode.idl
    Modules/webaudio/ChannelSplitterOptions.idl
    Modules/webaudio/ConstantSourceNode.idl
    Modules/webaudio/ConstantSourceOptions.idl
    Modules/webaudio/ConvolverNode.idl
    Modules/webaudio/ConvolverOptions.idl
    Modules/webaudio/DelayNode.idl
    Modules/webaudio/DelayOptions.idl
    Modules/webaudio/DistanceModelType.idl
    Modules/webaudio/DynamicsCompressorNode.idl
    Modules/webaudio/DynamicsCompressorOptions.idl
    Modules/webaudio/GainNode.idl
    Modules/webaudio/GainOptions.idl
    Modules/webaudio/IIRFilterNode.idl
    Modules/webaudio/IIRFilterOptions.idl
    Modules/webaudio/MediaElementAudioSourceNode.idl
    Modules/webaudio/MediaElementAudioSourceOptions.idl
    Modules/webaudio/MediaStreamAudioDestinationNode.idl
    Modules/webaudio/MediaStreamAudioSourceNode.idl
    Modules/webaudio/MediaStreamAudioSourceOptions.idl
    Modules/webaudio/OfflineAudioCompletionEvent.idl
    Modules/webaudio/OfflineAudioCompletionEventInit.idl
    Modules/webaudio/OfflineAudioContext.idl
    Modules/webaudio/OfflineAudioContextOptions.idl
    Modules/webaudio/OscillatorNode.idl
    Modules/webaudio/OscillatorOptions.idl
    Modules/webaudio/OscillatorType.idl
    Modules/webaudio/OverSampleType.idl
    Modules/webaudio/PannerNode.idl
    Modules/webaudio/PannerOptions.idl
    Modules/webaudio/PanningModelType.idl
    Modules/webaudio/PeriodicWave.idl
    Modules/webaudio/PeriodicWaveConstraints.idl
    Modules/webaudio/PeriodicWaveOptions.idl
    Modules/webaudio/StereoPannerNode.idl
    Modules/webaudio/StereoPannerOptions.idl
    Modules/webaudio/ScriptProcessorNode.idl
    Modules/webaudio/WaveShaperNode.idl
    Modules/webaudio/WaveShaperOptions.idl

    Modules/webcodecs/AvcEncoderConfig.idl
    Modules/webcodecs/BitrateMode.idl
    Modules/webcodecs/LatencyMode.idl
    Modules/webcodecs/HardwareAcceleration.idl
    Modules/webcodecs/PlaneLayout.idl
    Modules/webcodecs/VideoColorPrimaries.idl
    Modules/webcodecs/VideoColorSpace.idl
    Modules/webcodecs/VideoColorSpaceInit.idl
    Modules/webcodecs/VideoMatrixCoefficients.idl
    Modules/webcodecs/VideoPixelFormat.idl
    Modules/webcodecs/VideoTransferCharacteristics.idl
    Modules/webcodecs/WebCodecsAlphaOption.idl
    Modules/webcodecs/WebCodecsCodecState.idl
    Modules/webcodecs/WebCodecsEncodedVideoChunk.idl
    Modules/webcodecs/WebCodecsEncodedVideoChunkMetadata.idl
    Modules/webcodecs/WebCodecsEncodedVideoChunkOutputCallback.idl
    Modules/webcodecs/WebCodecsEncodedVideoChunkType.idl
    Modules/webcodecs/WebCodecsErrorCallback.idl
    Modules/webcodecs/WebCodecsVideoDecoder.idl
    Modules/webcodecs/WebCodecsVideoDecoderConfig.idl
    Modules/webcodecs/WebCodecsVideoDecoderSupport.idl
    Modules/webcodecs/WebCodecsVideoEncoder.idl
    Modules/webcodecs/WebCodecsVideoEncoderConfig.idl
    Modules/webcodecs/WebCodecsVideoEncoderEncodeOptions.idl
    Modules/webcodecs/WebCodecsVideoEncoderSupport.idl
    Modules/webcodecs/WebCodecsVideoFrameOutputCallback.idl
    Modules/webcodecs/WebCodecsVideoFrame.idl

    accessibility/AccessibilityRole.idl
    accessibility/AriaAttributes.idl

    animation/Animatable.idl
    animation/AnimationEffect.idl
    animation/AnimationFrameProvider.idl
    animation/AnimationFrameRatePreset.idl
    animation/AnimationPlaybackEvent.idl
    animation/AnimationPlaybackEventInit.idl
    animation/AnimationTimeline.idl
    animation/CSSAnimation.idl
    animation/CSSTransition.idl
    animation/CompositeOperation.idl
    animation/CompositeOperationOrAuto.idl
    animation/ComputedEffectTiming.idl
    animation/CustomAnimationOptions.idl
    animation/CustomEffect.idl
    animation/CustomEffectCallback.idl
    animation/Document+WebAnimations.idl
    animation/DocumentOrShadowRoot+WebAnimations.idl
    animation/DocumentTimeline.idl
    animation/DocumentTimelineOptions.idl
    animation/EffectTiming.idl
    animation/FillMode.idl
    animation/GetAnimationsOptions.idl
    animation/GlobalEventHandlers+CSSAnimations.idl
    animation/GlobalEventHandlers+CSSTransitions.idl
    animation/IterationCompositeOperation.idl
    animation/KeyframeAnimationOptions.idl
    animation/KeyframeEffect.idl
    animation/KeyframeEffectOptions.idl
    animation/OptionalEffectTiming.idl
    animation/PlaybackDirection.idl
    animation/WebAnimation.idl

    crypto/CryptoAlgorithmParameters.idl
    crypto/CryptoKey.idl
    crypto/CryptoKeyPair.idl
    crypto/CryptoKeyUsage.idl
    crypto/JsonWebKey.idl
    crypto/RsaOtherPrimesInfo.idl
    crypto/SubtleCrypto.idl

    crypto/keys/CryptoAesKeyAlgorithm.idl
    crypto/keys/CryptoEcKeyAlgorithm.idl
    crypto/keys/CryptoHmacKeyAlgorithm.idl
    crypto/keys/CryptoKeyAlgorithm.idl
    crypto/keys/CryptoRsaHashedKeyAlgorithm.idl
    crypto/keys/CryptoRsaKeyAlgorithm.idl

    crypto/parameters/AesCbcCfbParams.idl
    crypto/parameters/AesCtrParams.idl
    crypto/parameters/AesGcmParams.idl
    crypto/parameters/AesKeyParams.idl
    crypto/parameters/EcKeyParams.idl
    crypto/parameters/EcdhKeyDeriveParams.idl
    crypto/parameters/EcdsaParams.idl
    crypto/parameters/HkdfParams.idl
    crypto/parameters/HmacKeyParams.idl
    crypto/parameters/Pbkdf2Params.idl
    crypto/parameters/RsaHashedImportParams.idl
    crypto/parameters/RsaHashedKeyGenParams.idl
    crypto/parameters/RsaKeyGenParams.idl
    crypto/parameters/RsaOaepParams.idl
    crypto/parameters/RsaPssParams.idl

    css/CSSConditionRule.idl
    css/CSSContainerRule.idl
    css/CSSCounterStyleRule.idl
    css/CSSFontFaceRule.idl
    css/CSSFontFeatureValuesRule.idl
    css/CSSFontPaletteValuesRule.idl
    css/CSSGroupingRule.idl
    css/CSSImportRule+Layer.idl
    css/CSSImportRule.idl
    css/CSSKeyframeRule.idl
    css/CSSKeyframesRule.idl
    css/CSSLayerBlockRule.idl
    css/CSSLayerStatementRule.idl
    css/CSSMediaRule.idl
    css/CSSNamespaceRule.idl
    css/CSSPaintCallback.idl
    css/CSSPaintSize.idl
    css/CSSPageRule.idl
    css/CSSRule.idl
    css/CSSRuleList.idl
    css/CSSStyleDeclaration.idl
    css/CSSStyleRule.idl
    css/CSSStyleSheet.idl
    css/CSSSupportsRule.idl
    css/CSSUnknownRule.idl
    css/DocumentOrShadowRoot+CSSOM.idl
    css/DOMCSSCustomPropertyDescriptor.idl
    css/DOMCSSNamespace+CSSNumericFactory.idl
    css/DOMCSSNamespace+CSSPainting.idl
    css/DOMCSSNamespace+CSSPropertiesandValues.idl
    css/DOMCSSNamespace.idl
    css/DOMMatrix.idl
    css/DOMMatrix2DInit.idl
    css/DOMMatrixInit.idl
    css/DOMMatrixReadOnly.idl
    css/DeprecatedCSSOMCounter.idl
    css/DeprecatedCSSOMPrimitiveValue.idl
    css/DeprecatedCSSOMRGBColor.idl
    css/DeprecatedCSSOMRect.idl
    css/DeprecatedCSSOMValue.idl
    css/DeprecatedCSSOMValueList.idl
    css/ElementCSSInlineStyle.idl
    css/FontFace.idl
    css/FontFaceSet.idl
    css/FontFaceSource.idl
    css/LinkStyle.idl
    css/MediaList.idl
    css/MediaQueryList.idl
    css/MediaQueryListEvent.idl
    css/StyleMedia.idl
    css/StyleSheet.idl
    css/StyleSheetList.idl

    css/typedom/CSSKeywordValue.idl
    css/typedom/CSSNumericValue.idl
    css/typedom/CSSOMVariableReferenceValue.idl
    css/typedom/CSSStyleImageValue.idl
    css/typedom/CSSStyleValue.idl
    css/typedom/CSSUnitValue.idl
    css/typedom/CSSUnparsedValue.idl
    css/typedom/StylePropertyMap.idl
    css/typedom/StylePropertyMapReadOnly.idl

    css/typedom/color/CSSColor.idl
    css/typedom/color/CSSColorValue.idl
    css/typedom/color/CSSHSL.idl
    css/typedom/color/CSSHWB.idl
    css/typedom/color/CSSLCH.idl
    css/typedom/color/CSSLab.idl
    css/typedom/color/CSSOKLCH.idl
    css/typedom/color/CSSOKLab.idl
    css/typedom/color/CSSRGB.idl

    css/typedom/numeric/CSSMathClamp.idl
    css/typedom/numeric/CSSMathInvert.idl
    css/typedom/numeric/CSSMathMax.idl
    css/typedom/numeric/CSSMathMin.idl
    css/typedom/numeric/CSSMathNegate.idl
    css/typedom/numeric/CSSMathOperator.idl
    css/typedom/numeric/CSSMathProduct.idl
    css/typedom/numeric/CSSMathSum.idl
    css/typedom/numeric/CSSMathValue.idl
    css/typedom/numeric/CSSNumericArray.idl
    css/typedom/numeric/CSSNumericBaseType.idl
    css/typedom/numeric/CSSNumericType.idl

    css/typedom/transform/CSSMatrixComponent.idl
    css/typedom/transform/CSSMatrixComponentOptions.idl
    css/typedom/transform/CSSPerspective.idl
    css/typedom/transform/CSSRotate.idl
    css/typedom/transform/CSSScale.idl
    css/typedom/transform/CSSSkew.idl
    css/typedom/transform/CSSSkewX.idl
    css/typedom/transform/CSSSkewY.idl
    css/typedom/transform/CSSTransformComponent.idl
    css/typedom/transform/CSSTransformValue.idl
    css/typedom/transform/CSSTranslate.idl

    dom/AbortAlgorithm.idl
    dom/AbortController.idl
    dom/AbortSignal.idl
    dom/AbstractRange.idl
    dom/AddEventListenerOptions.idl
    dom/AnimationEvent.idl
    dom/Attr.idl
    dom/BeforeUnloadEvent.idl
    dom/BroadcastChannel.idl
    dom/CDATASection.idl
    dom/CharacterData.idl
    dom/ChildNode.idl
    dom/ClipboardEvent.idl
    dom/Comment.idl
    dom/CompositionEvent.idl
    dom/CustomElementRegistry.idl
    dom/CustomEvent.idl
    dom/DOMException.idl
    dom/DOMImplementation.idl
    dom/DOMPoint.idl
    dom/DOMPointInit.idl
    dom/DOMPointReadOnly.idl
    dom/DOMQuad.idl
    dom/DOMQuadInit.idl
    dom/DOMRect.idl
    dom/DOMRectInit.idl
    dom/DOMRectList.idl
    dom/DOMRectReadOnly.idl
    dom/DOMStringList.idl
    dom/DOMStringMap.idl
    dom/DataTransfer.idl
    dom/DataTransferItem.idl
    dom/DataTransferItemList.idl
    dom/DeviceMotionEvent.idl
    dom/DeviceOrientationEvent.idl
    dom/DeviceOrientationOrMotionPermissionState.idl
    dom/Document+CSSOMView.idl
    dom/Document+Fullscreen.idl
    dom/Document+HTML.idl
    dom/Document+HTMLObsolete.idl
    dom/Document+PageVisibility.idl
    dom/Document+PointerLock.idl
    dom/Document+Selection.idl
    dom/Document+StorageAccess.idl
    dom/Document+Touch.idl
    dom/Document+UndoMananger.idl
    dom/Document.idl
    dom/DocumentAndElementEventHandlers.idl
    dom/DocumentFragment.idl
    dom/DocumentOrShadowRoot+Fullscreen.idl
    dom/DocumentOrShadowRoot+PointerLock.idl
    dom/DocumentOrShadowRoot.idl
    dom/DocumentType.idl
    dom/DragEvent.idl
    dom/Element+CSSOMView.idl
    dom/Element+ComputedStyleMap.idl
    dom/Element+DOMParsing.idl
    dom/Element+Fullscreen.idl
    dom/Element+PointerEvents.idl
    dom/Element+PointerLock.idl
    dom/Element.idl
    dom/ElementContentEditable.idl
    dom/ElementInternals.idl
    dom/ErrorEvent.idl
    dom/Event.idl
    dom/EventInit.idl
    dom/EventListenerOptions.idl
    dom/EventModifierInit.idl
    dom/EventTarget.idl
    dom/FocusEvent.idl
    dom/FocusOptions.idl
    dom/FormDataEvent.idl
    dom/FullscreenOptions.idl
    dom/GlobalEventHandlers+PointerEvents.idl
    dom/GlobalEventHandlers+Selection.idl
    dom/GlobalEventHandlers.idl
    dom/HashChangeEvent.idl
    dom/IdleDeadline.idl
    dom/IdleRequestCallback.idl
    dom/IdleRequestOptions.idl
    dom/InnerHTML.idl
    dom/InputEvent.idl
    dom/KeyboardEvent.idl
    dom/MessageChannel.idl
    dom/MessageEvent.idl
    dom/MessagePort.idl
    dom/MouseEvent.idl
    dom/MouseEventInit.idl
    dom/MutationCallback.idl
    dom/MutationEvent.idl
    dom/MutationObserver.idl
    dom/MutationRecord.idl
    dom/NamedNodeMap.idl
    dom/NavigatorMaxTouchPoints.idl
    dom/Node.idl
    dom/NodeFilter.idl
    dom/NodeIterator.idl
    dom/NodeList.idl
    dom/NonDocumentTypeChildNode.idl
    dom/NonElementParentNode.idl
    dom/OverflowEvent.idl
    dom/PageTransitionEvent.idl
    dom/ParentNode.idl
    dom/PointerEvent.idl
    dom/PopStateEvent.idl
    dom/ProcessingInstruction.idl
    dom/ProgressEvent.idl
    dom/PromiseRejectionEvent.idl
    dom/Range+CSSOMView.idl
    dom/Range+DOMParsing.idl
    dom/Range.idl
    dom/RequestAnimationFrameCallback.idl
    dom/SecurityPolicyViolationEvent.idl
    dom/SecurityPolicyViolationEventDisposition.idl
    dom/ShadowRoot.idl
    dom/ShadowRootInit.idl
    dom/ShadowRootMode.idl
    dom/SlotAssignmentMode.idl
    dom/Slotable.idl
    dom/StaticRange.idl
    dom/StringCallback.idl
    dom/Text.idl
    dom/TextDecoder.idl
    dom/TextDecoderStream.idl
    dom/TextDecoderStreamDecoder.idl
    dom/TextEncoder.idl
    dom/TextEncoderStream.idl
    dom/TextEncoderStreamEncoder.idl
    dom/TextEvent.idl
    dom/Touch.idl
    dom/TouchEvent.idl
    dom/TouchList.idl
    dom/TransitionEvent.idl
    dom/TreeWalker.idl
    dom/UIEvent.idl
    dom/UIEventInit.idl
    dom/VisibilityState.idl
    dom/WheelEvent.idl
    dom/XMLDocument.idl

    fileapi/Blob.idl
    fileapi/BlobCallback.idl
    fileapi/BlobPropertyBag.idl
    fileapi/EndingType.idl
    fileapi/File.idl
    fileapi/FileList.idl
    fileapi/FileReader.idl
    fileapi/FileReaderSync.idl

    html/DOMFormData.idl
    html/DOMTokenList.idl
    html/DOMURL.idl
    html/HTMLAllCollection.idl
    html/HTMLAnchorElement.idl
    html/HTMLAreaElement.idl
    html/HTMLAttachmentElement.idl
    html/HTMLAudioElement.idl
    html/HTMLBRElement.idl
    html/HTMLBaseElement.idl
    html/HTMLBodyElement+Compat.idl
    html/HTMLBodyElement.idl
    html/HTMLButtonElement.idl
    html/HTMLCanvasElement.idl
    html/HTMLCollection.idl
    html/HTMLDListElement.idl
    html/HTMLDataElement.idl
    html/HTMLDataListElement.idl
    html/HTMLDetailsElement.idl
    html/HTMLDialogElement.idl
    html/HTMLDirectoryElement.idl
    html/HTMLDivElement.idl
    html/HTMLDocument.idl
    html/HTMLElement+CSSOMView.idl
    html/HTMLElement.idl
    html/HTMLEmbedElement.idl
    html/HTMLFieldSetElement.idl
    html/HTMLFontElement.idl
    html/HTMLFormControlsCollection.idl
    html/HTMLFormElement.idl
    html/HTMLFrameElement.idl
    html/HTMLFrameSetElement.idl
    html/HTMLHRElement.idl
    html/HTMLHeadElement.idl
    html/HTMLHeadingElement.idl
    html/HTMLHtmlElement.idl
    html/HTMLHyperlinkElementUtils.idl
    html/HTMLIFrameElement.idl
    html/HTMLImageElement+CSSOMView.idl
    html/HTMLImageElement.idl
    html/HTMLInputElement.idl
    html/HTMLLIElement.idl
    html/HTMLLabelElement.idl
    html/HTMLLegendElement.idl
    html/HTMLLinkElement.idl
    html/HTMLMapElement.idl
    html/HTMLMarqueeElement.idl
    html/HTMLMediaElement+AudioOutput.idl
    html/HTMLMediaElement.idl
    html/HTMLMenuElement.idl
    html/HTMLMenuItemElement.idl
    html/HTMLMetaElement.idl
    html/HTMLMeterElement.idl
    html/HTMLModElement.idl
    html/HTMLOListElement.idl
    html/HTMLObjectElement.idl
    html/HTMLOptGroupElement.idl
    html/HTMLOptionElement.idl
    html/HTMLOptionsCollection.idl
    html/HTMLOrForeignElement.idl
    html/HTMLOutputElement.idl
    html/HTMLParagraphElement.idl
    html/HTMLParamElement.idl
    html/HTMLPictureElement.idl
    html/HTMLPreElement.idl
    html/HTMLProgressElement.idl
    html/HTMLQuoteElement.idl
    html/HTMLScriptElement.idl
    html/HTMLSelectElement.idl
    html/HTMLSlotElement.idl
    html/HTMLSourceElement.idl
    html/HTMLSpanElement.idl
    html/HTMLStyleElement.idl
    html/HTMLTableCaptionElement.idl
    html/HTMLTableCellElement.idl
    html/HTMLTableColElement.idl
    html/HTMLTableElement.idl
    html/HTMLTableRowElement.idl
    html/HTMLTableSectionElement.idl
    html/HTMLTemplateElement.idl
    html/HTMLTextAreaElement.idl
    html/HTMLTimeElement.idl
    html/HTMLTitleElement.idl
    html/HTMLTrackElement.idl
    html/HTMLUListElement.idl
    html/HTMLUnknownElement.idl
    html/HTMLVideoElement+RequestVideoFrameCallback.idl
    html/HTMLVideoElement.idl
    html/ImageBitmap.idl
    html/ImageBitmapOptions.idl
    html/ImageData.idl
    html/ImageDataSettings.idl
    html/MediaController.idl
    html/MediaEncryptedEvent.idl
    html/MediaError.idl
    html/OffscreenCanvas.idl
    html/RadioNodeList.idl
    html/SubmitEvent.idl
    html/TextMetrics.idl
    html/TimeRanges.idl
    html/URLSearchParams.idl
    html/ValidityState.idl
    html/VideoFrameMetadata.idl
    html/VideoFrameRequestCallback.idl
    html/VoidCallback.idl

    html/canvas/CanvasCompositing.idl
    html/canvas/CanvasDirection.idl
    html/canvas/CanvasDrawImage.idl
    html/canvas/CanvasDrawPath.idl
    html/canvas/CanvasFillRule.idl
    html/canvas/CanvasFillStrokeStyles.idl
    html/canvas/CanvasFilters.idl
    html/canvas/CanvasGradient.idl
    html/canvas/CanvasImageData.idl
    html/canvas/CanvasImageSmoothing.idl
    html/canvas/CanvasLineCap.idl
    html/canvas/CanvasLineJoin.idl
    html/canvas/CanvasPath.idl
    html/canvas/CanvasPathDrawingStyles.idl
    html/canvas/CanvasPattern.idl
    html/canvas/CanvasRect.idl
    html/canvas/CanvasRenderingContext2D.idl
    html/canvas/CanvasRenderingContext2DSettings.idl
    html/canvas/CanvasShadowStyles.idl
    html/canvas/CanvasState.idl
    html/canvas/CanvasText.idl
    html/canvas/CanvasTextAlign.idl
    html/canvas/CanvasTextBaseline.idl
    html/canvas/CanvasTextDrawingStyles.idl
    html/canvas/CanvasTransform.idl
    html/canvas/CanvasUserInterface.idl
    html/canvas/ImageBitmapRenderingContext.idl
    html/canvas/ImageBitmapRenderingContextSettings.idl
    html/canvas/ImageSmoothingQuality.idl
    html/canvas/OffscreenCanvasRenderingContext2D.idl
    html/canvas/PaintRenderingContext2D.idl
    html/canvas/Path2D.idl
    html/canvas/PredefinedColorSpace.idl

    html/track/AudioTrack.idl
    html/track/AudioTrackConfiguration.idl
    html/track/AudioTrackList.idl
    html/track/DataCue.idl
    html/track/TextTrack.idl
    html/track/TextTrackCue.idl
    html/track/TextTrackCueGeneric.idl
    html/track/TextTrackCueList.idl
    html/track/TextTrackList.idl
    html/track/TrackEvent.idl
    html/track/VTTCue.idl
    html/track/VTTRegion.idl
    html/track/VTTRegionList.idl
    html/track/VideoTrack.idl
    html/track/VideoTrackConfiguration.idl
    html/track/VideoTrackList.idl

    inspector/CommandLineAPIHost.idl
    inspector/InspectorAuditAccessibilityObject.idl
    inspector/InspectorAuditDOMObject.idl
    inspector/InspectorAuditResourcesObject.idl
    inspector/InspectorFrontendHost.idl

    loader/COEPInheritenceViolationReportBody.idl
    loader/CORPViolationReportBody.idl
    loader/appcache/DOMApplicationCache.idl

    mathml/MathMLElement.idl
    mathml/MathMLMathElement.idl

    page/BarProp.idl
    page/Crypto.idl
    page/DOMSelection.idl
    page/DOMWindow+CSSOM.idl
    page/DOMWindow+CSSOMView.idl
    page/DOMWindow+Compat.idl
    page/DOMWindow+DeviceMotion.idl
    page/DOMWindow+DeviceOrientation.idl
    page/DOMWindow+RequestIdleCallback.idl
    page/DOMWindow+Selection.idl
    page/DOMWindow+VisualViewport.idl
    page/DOMWindow.idl
    page/EventSource.idl
    page/History.idl
    page/IntersectionObserver.idl
    page/IntersectionObserverCallback.idl
    page/IntersectionObserverEntry.idl
    page/Location.idl
    page/Navigator.idl
    page/NavigatorCookies.idl
    page/NavigatorID.idl
    page/NavigatorLanguage.idl
    page/NavigatorOnLine.idl
    page/NavigatorPlugins.idl
    page/NavigatorServiceWorker.idl
    page/NavigatorShare.idl
    page/NavigatorStorage.idl
    page/Performance+NavigationTiming.idl
    page/Performance+PerformanceTimeline.idl
    page/Performance+ResourceTiming.idl
    page/Performance+UserTiming.idl
    page/Performance.idl
    page/PerformanceEntry.idl
    page/PerformanceMark.idl
    page/PerformanceMarkOptions.idl
    page/PerformanceMeasure.idl
    page/PerformanceMeasureOptions.idl
    page/PerformanceObserver.idl
    page/PerformanceObserverCallback.idl
    page/PerformanceObserverEntryList.idl
    page/PerformanceNavigation.idl
    page/PerformanceNavigationTiming.idl
    page/PerformancePaintTiming.idl
    page/PerformanceResourceTiming.idl
    page/PerformanceServerTiming.idl
    page/PerformanceTiming.idl
    page/RemoteDOMWindow.idl
    page/ResizeObserver.idl
    page/ResizeObserverBoxOptions.idl
    page/ResizeObserverCallback.idl
    page/ResizeObserverEntry.idl
    page/ResizeObserverOptions.idl
    page/ResizeObserverSize.idl
    page/Screen.idl
    page/ScreenOrientation.idl
    page/ScrollBehavior.idl
    page/ScrollIntoViewOptions.idl
    page/ScrollLogicalPosition.idl
    page/ScrollOptions.idl
    page/ScrollToOptions.idl
    page/ShadowRealmGlobalScope.idl
    page/ShareData.idl
    page/StructuredSerializeOptions.idl
    page/UndoItem.idl
    page/UndoManager.idl
    page/VisualViewport.idl
    page/WebKitPoint.idl
    page/WindowEventHandlers.idl
    page/WindowLocalStorage.idl
    page/WindowOrWorkerGlobalScope+Crypto.idl
    page/WindowOrWorkerGlobalScope+Performance.idl
    page/WindowOrWorkerGlobalScope.idl
    page/WindowSessionStorage.idl
    page/WorkerNavigator.idl

    page/csp/CSPViolationReportBody.idl

    plugins/DOMMimeType.idl
    plugins/DOMMimeTypeArray.idl
    plugins/DOMPlugin.idl
    plugins/DOMPluginArray.idl

    storage/Storage.idl
    storage/StorageEvent.idl

    worklets/PaintWorkletGlobalScope.idl
    worklets/Worklet.idl
    worklets/WorkletGlobalScope.idl
    worklets/WorkletOptions.idl

    xml/CustomXPathNSResolver.idl
    xml/DOMParser.idl
    xml/ParseFromStringOptions.idl
    xml/XMLSerializer.idl
    xml/XPathEvaluator.idl
    xml/XPathEvaluatorBase.idl
    xml/XPathExpression.idl
    xml/XPathNSResolver.idl
    xml/XPathResult.idl
    xml/XSLTProcessor.idl
)

set(WebCore_SVG_IDL_FILES
    svg/Document+SVG.idl
    svg/SVGAElement.idl
    svg/SVGAngle.idl
    svg/SVGAnimateColorElement.idl
    svg/SVGAnimateElement.idl
    svg/SVGAnimateMotionElement.idl
    svg/SVGAnimateTransformElement.idl
    svg/SVGAnimatedAngle.idl
    svg/SVGAnimatedBoolean.idl
    svg/SVGAnimatedEnumeration.idl
    svg/SVGAnimatedInteger.idl
    svg/SVGAnimatedLength.idl
    svg/SVGAnimatedLengthList.idl
    svg/SVGAnimatedNumber.idl
    svg/SVGAnimatedNumberList.idl
    svg/SVGAnimatedPreserveAspectRatio.idl
    svg/SVGAnimatedRect.idl
    svg/SVGAnimatedString.idl
    svg/SVGAnimatedTransformList.idl
    svg/SVGAnimationElement.idl
    svg/SVGCircleElement.idl
    svg/SVGClipPathElement.idl
    svg/SVGComponentTransferFunctionElement.idl
    svg/SVGDefsElement.idl
    svg/SVGDescElement.idl
    svg/SVGElement.idl
    svg/SVGEllipseElement.idl
    svg/SVGFEBlendElement.idl
    svg/SVGFEColorMatrixElement.idl
    svg/SVGFEComponentTransferElement.idl
    svg/SVGFECompositeElement.idl
    svg/SVGFEConvolveMatrixElement.idl
    svg/SVGFEDiffuseLightingElement.idl
    svg/SVGFEDisplacementMapElement.idl
    svg/SVGFEDistantLightElement.idl
    svg/SVGFEDropShadowElement.idl
    svg/SVGFEFloodElement.idl
    svg/SVGFEFuncAElement.idl
    svg/SVGFEFuncBElement.idl
    svg/SVGFEFuncGElement.idl
    svg/SVGFEFuncRElement.idl
    svg/SVGFEGaussianBlurElement.idl
    svg/SVGFEImageElement.idl
    svg/SVGFEMergeElement.idl
    svg/SVGFEMergeNodeElement.idl
    svg/SVGFEMorphologyElement.idl
    svg/SVGFEOffsetElement.idl
    svg/SVGFEPointLightElement.idl
    svg/SVGFESpecularLightingElement.idl
    svg/SVGFESpotLightElement.idl
    svg/SVGFETileElement.idl
    svg/SVGFETurbulenceElement.idl
    svg/SVGFilterElement.idl
    svg/SVGFilterPrimitiveStandardAttributes.idl
    svg/SVGFitToViewBox.idl
    svg/SVGForeignObjectElement.idl
    svg/SVGGElement.idl
    svg/SVGGeometryElement.idl
    svg/SVGGradientElement.idl
    svg/SVGGraphicsElement.idl
    svg/SVGImageElement.idl
    svg/SVGLength.idl
    svg/SVGLengthList.idl
    svg/SVGLineElement.idl
    svg/SVGLinearGradientElement.idl
    svg/SVGMPathElement.idl
    svg/SVGMarkerElement.idl
    svg/SVGMaskElement.idl
    svg/SVGMatrix.idl
    svg/SVGMetadataElement.idl
    svg/SVGNumber.idl
    svg/SVGNumberList.idl
    svg/SVGPathElement.idl
    svg/SVGPathSeg.idl
    svg/SVGPathSegArcAbs.idl
    svg/SVGPathSegArcRel.idl
    svg/SVGPathSegClosePath.idl
    svg/SVGPathSegCurvetoCubicAbs.idl
    svg/SVGPathSegCurvetoCubicRel.idl
    svg/SVGPathSegCurvetoCubicSmoothAbs.idl
    svg/SVGPathSegCurvetoCubicSmoothRel.idl
    svg/SVGPathSegCurvetoQuadraticAbs.idl
    svg/SVGPathSegCurvetoQuadraticRel.idl
    svg/SVGPathSegCurvetoQuadraticSmoothAbs.idl
    svg/SVGPathSegCurvetoQuadraticSmoothRel.idl
    svg/SVGPathSegLinetoAbs.idl
    svg/SVGPathSegLinetoHorizontalAbs.idl
    svg/SVGPathSegLinetoHorizontalRel.idl
    svg/SVGPathSegLinetoRel.idl
    svg/SVGPathSegLinetoVerticalAbs.idl
    svg/SVGPathSegLinetoVerticalRel.idl
    svg/SVGPathSegList.idl
    svg/SVGPathSegMovetoAbs.idl
    svg/SVGPathSegMovetoRel.idl
    svg/SVGPatternElement.idl
    svg/SVGPoint.idl
    svg/SVGPointList.idl
    svg/SVGPolygonElement.idl
    svg/SVGPolylineElement.idl
    svg/SVGPreserveAspectRatio.idl
    svg/SVGRadialGradientElement.idl
    svg/SVGRect.idl
    svg/SVGRectElement.idl
    svg/SVGRenderingIntent.idl
    svg/SVGSVGElement.idl
    svg/SVGScriptElement.idl
    svg/SVGSetElement.idl
    svg/SVGStopElement.idl
    svg/SVGStringList.idl
    svg/SVGStyleElement.idl
    svg/SVGSwitchElement.idl
    svg/SVGSymbolElement.idl
    svg/SVGTSpanElement.idl
    svg/SVGTests.idl
    svg/SVGTextContentElement.idl
    svg/SVGTextElement.idl
    svg/SVGTextPathElement.idl
    svg/SVGTextPositioningElement.idl
    svg/SVGTitleElement.idl
    svg/SVGTransform.idl
    svg/SVGTransformList.idl
    svg/SVGURIReference.idl
    svg/SVGUnitTypes.idl
    svg/SVGUseElement.idl
    svg/SVGViewElement.idl
    svg/SVGViewSpec.idl
    svg/SVGZoomAndPan.idl
)

list(APPEND WebCore_NON_SVG_IDL_FILES
    Modules/WebGPU/GPU.idl
    Modules/WebGPU/GPUAdapter.idl
    Modules/WebGPU/GPUAddressMode.idl
    Modules/WebGPU/GPUBindGroup.idl
    Modules/WebGPU/GPUBindGroupDescriptor.idl
    Modules/WebGPU/GPUBindGroupEntry.idl
    Modules/WebGPU/GPUBindGroupLayout.idl
    Modules/WebGPU/GPUBindGroupLayoutDescriptor.idl
    Modules/WebGPU/GPUBindGroupLayoutEntry.idl
    Modules/WebGPU/GPUBlendComponent.idl
    Modules/WebGPU/GPUBlendFactor.idl
    Modules/WebGPU/GPUBlendOperation.idl
    Modules/WebGPU/GPUBlendState.idl
    Modules/WebGPU/GPUBuffer.idl
    Modules/WebGPU/GPUBufferBinding.idl
    Modules/WebGPU/GPUBufferBindingLayout.idl
    Modules/WebGPU/GPUBufferBindingType.idl
    Modules/WebGPU/GPUBufferDescriptor.idl
    Modules/WebGPU/GPUBufferUsage.idl
    Modules/WebGPU/GPUCanvasCompositingAlphaMode.idl
    Modules/WebGPU/GPUCanvasConfiguration.idl
    Modules/WebGPU/GPUCanvasContext.idl
    Modules/WebGPU/GPUColorDict.idl
    Modules/WebGPU/GPUColorTargetState.idl
    Modules/WebGPU/GPUColorWrite.idl
    Modules/WebGPU/GPUCommandBuffer.idl
    Modules/WebGPU/GPUCommandBufferDescriptor.idl
    Modules/WebGPU/GPUCommandEncoder.idl
    Modules/WebGPU/GPUCommandEncoderDescriptor.idl
    Modules/WebGPU/GPUCommandsMixin.idl
    Modules/WebGPU/GPUCompareFunction.idl
    Modules/WebGPU/GPUCompilationInfo.idl
    Modules/WebGPU/GPUCompilationMessage.idl
    Modules/WebGPU/GPUCompilationMessageType.idl
    Modules/WebGPU/GPUComputePassDescriptor.idl
    Modules/WebGPU/GPUComputePassEncoder.idl
    Modules/WebGPU/GPUComputePassTimestampLocation.idl
    Modules/WebGPU/GPUComputePassTimestampWrite.idl
    Modules/WebGPU/GPUComputePipeline.idl
    Modules/WebGPU/GPUComputePipelineDescriptor.idl
    Modules/WebGPU/GPUCullMode.idl
    Modules/WebGPU/GPUDebugCommandsMixin.idl
    Modules/WebGPU/GPUDepthStencilState.idl
    Modules/WebGPU/GPUDevice.idl
    Modules/WebGPU/GPUDeviceDescriptor.idl
    Modules/WebGPU/GPUDeviceError.idl
    Modules/WebGPU/GPUDeviceLost.idl
    Modules/WebGPU/GPUDeviceLostInfo.idl
    Modules/WebGPU/GPUDeviceLostReason.idl
    Modules/WebGPU/GPUDeviceUncapturedError.idl
    Modules/WebGPU/GPUErrorFilter.idl
    Modules/WebGPU/GPUExtent3DDict.idl
    Modules/WebGPU/GPUExternalTexture.idl
    Modules/WebGPU/GPUExternalTextureBindingLayout.idl
    Modules/WebGPU/GPUExternalTextureDescriptor.idl
    Modules/WebGPU/GPUFeatureName.idl
    Modules/WebGPU/GPUFilterMode.idl
    Modules/WebGPU/GPUFragmentState.idl
    Modules/WebGPU/GPUFrontFace.idl
    Modules/WebGPU/GPUImageCopyBuffer.idl
    Modules/WebGPU/GPUImageCopyExternalImage.idl
    Modules/WebGPU/GPUImageCopyTexture.idl
    Modules/WebGPU/GPUImageCopyTextureTagged.idl
    Modules/WebGPU/GPUImageDataLayout.idl
    Modules/WebGPU/GPUIndexFormat.idl
    Modules/WebGPU/GPULoadOp.idl
    Modules/WebGPU/GPUMapMode.idl
    Modules/WebGPU/GPUMultisampleState.idl
    Modules/WebGPU/GPUObjectBase.idl
    Modules/WebGPU/GPUObjectDescriptorBase.idl
    Modules/WebGPU/GPUOrigin2DDict.idl
    Modules/WebGPU/GPUOrigin3DDict.idl
    Modules/WebGPU/GPUOutOfMemoryError.idl
    Modules/WebGPU/GPUPipelineBase.idl
    Modules/WebGPU/GPUPipelineDescriptorBase.idl
    Modules/WebGPU/GPUPipelineLayout.idl
    Modules/WebGPU/GPUPipelineLayoutDescriptor.idl
    Modules/WebGPU/GPUPowerPreference.idl
    Modules/WebGPU/GPUPredefinedColorSpace.idl
    Modules/WebGPU/GPUPrimitiveState.idl
    Modules/WebGPU/GPUPrimitiveTopology.idl
    Modules/WebGPU/GPUProgrammablePassEncoder.idl
    Modules/WebGPU/GPUProgrammableStage.idl
    Modules/WebGPU/GPUQuerySet.idl
    Modules/WebGPU/GPUQuerySetDescriptor.idl
    Modules/WebGPU/GPUQueryType.idl
    Modules/WebGPU/GPUQueue.idl
    Modules/WebGPU/GPURenderBundle.idl
    Modules/WebGPU/GPURenderBundleDescriptor.idl
    Modules/WebGPU/GPURenderBundleEncoder.idl
    Modules/WebGPU/GPURenderBundleEncoderDescriptor.idl
    Modules/WebGPU/GPURenderEncoderBase.idl
    Modules/WebGPU/GPURenderPassColorAttachment.idl
    Modules/WebGPU/GPURenderPassDepthStencilAttachment.idl
    Modules/WebGPU/GPURenderPassDescriptor.idl
    Modules/WebGPU/GPURenderPassEncoder.idl
    Modules/WebGPU/GPURenderPassLayout.idl
    Modules/WebGPU/GPURenderPassTimestampLocation.idl
    Modules/WebGPU/GPURenderPassTimestampWrite.idl
    Modules/WebGPU/GPURenderPipeline.idl
    Modules/WebGPU/GPURenderPipelineDescriptor.idl
    Modules/WebGPU/GPURequestAdapterOptions.idl
    Modules/WebGPU/GPUSampler.idl
    Modules/WebGPU/GPUSamplerBindingLayout.idl
    Modules/WebGPU/GPUSamplerBindingType.idl
    Modules/WebGPU/GPUSamplerDescriptor.idl
    Modules/WebGPU/GPUShaderModule.idl
    Modules/WebGPU/GPUShaderModuleCompilationHint.idl
    Modules/WebGPU/GPUShaderModuleDescriptor.idl
    Modules/WebGPU/GPUShaderStage.idl
    Modules/WebGPU/GPUStencilFaceState.idl
    Modules/WebGPU/GPUStencilOperation.idl
    Modules/WebGPU/GPUStorageTextureAccess.idl
    Modules/WebGPU/GPUStorageTextureBindingLayout.idl
    Modules/WebGPU/GPUStoreOp.idl
    Modules/WebGPU/GPUSupportedFeatures.idl
    Modules/WebGPU/GPUSupportedLimits.idl
    Modules/WebGPU/GPUTexture.idl
    Modules/WebGPU/GPUTextureAspect.idl
    Modules/WebGPU/GPUTextureBindingLayout.idl
    Modules/WebGPU/GPUTextureDescriptor.idl
    Modules/WebGPU/GPUTextureDimension.idl
    Modules/WebGPU/GPUTextureFormat.idl
    Modules/WebGPU/GPUTextureSampleType.idl
    Modules/WebGPU/GPUTextureUsage.idl
    Modules/WebGPU/GPUTextureView.idl
    Modules/WebGPU/GPUTextureViewDescriptor.idl
    Modules/WebGPU/GPUTextureViewDimension.idl
    Modules/WebGPU/GPUUncapturedErrorEvent.idl
    Modules/WebGPU/GPUUncapturedErrorEventInit.idl
    Modules/WebGPU/GPUValidationError.idl
    Modules/WebGPU/GPUVertexAttribute.idl
    Modules/WebGPU/GPUVertexBufferLayout.idl
    Modules/WebGPU/GPUVertexFormat.idl
    Modules/WebGPU/GPUVertexState.idl
    Modules/WebGPU/GPUVertexStepMode.idl
    Modules/WebGPU/NavigatorGPU.idl
)

set(WebCore_IDL_FILES
    ${WebCore_NON_SVG_IDL_FILES}
    ${WebCore_SVG_IDL_FILES}
)

set(WebCore_CSS_PROPERTY_NAMES
    ${WEBCORE_DIR}/css/CSSProperties.json
)

set(WebCore_CSS_VALUE_KEYWORDS
    ${WEBCORE_DIR}/css/CSSValueKeywords.in
)

set(WebCore_USER_AGENT_STYLE_SHEETS
    ${WEBCORE_DIR}/css/dialog.css
    ${WEBCORE_DIR}/css/fullscreen.css
    ${WEBCORE_DIR}/css/html.css
    ${WEBCORE_DIR}/css/mathml.css
    ${WEBCORE_DIR}/css/plugIns.css
    ${WEBCORE_DIR}/css/quirks.css
    ${WEBCORE_DIR}/css/svg.css
    ${WEBCORE_DIR}/html/shadow/imageOverlay.css
    ${WEBCORE_DIR}/html/shadow/meterElementShadow.css
)

set(WebCore_PLUG_INS_RESOURCES
    ${WEBCORE_DIR}/Resources/plugIns.js
)

set(WebCore_LIBRARIES
    LibXml2::LibXml2
    SQLite::SQLite3
    ZLIB::ZLIB
)
set(WebCore_FRAMEWORKS
    PAL
    WTF
)
if (NOT USE_SYSTEM_MALLOC)
    list(APPEND WebCore_FRAMEWORKS bmalloc)
endif ()

if (ENABLE_XSLT)
    list(APPEND WebCore_LIBRARIES LibXslt::LibXslt)
endif ()

# For platforms that want to use system-provided OpenGL (ES) / EGL headers,
# these include directories, libraries or definitions need to be
# added before the ANGLE directories.
if (USE_ANGLE_EGL)
    list(APPEND WebCore_LIBRARIES
        ANGLE::EGL
        ANGLE::GLES
    )
elseif (USE_LIBEPOXY)
    list(APPEND WebCore_SYSTEM_INCLUDE_DIRECTORIES
        ${LIBEPOXY_INCLUDE_DIRS}
    )
    list(APPEND WebCore_LIBRARIES
        ${LIBEPOXY_LIBRARIES}
    )
    add_definitions(${LIBEPOXY_DEFINITIONS})
else ()
    if (USE_OPENGL)
        list(APPEND WebCore_LIBRARIES OpenGL::OpenGL)
        if (TARGET OpenGL::GLX)
            list(APPEND WebCore_LIBRARIES OpenGL::GLX)
        endif ()
    elseif (USE_OPENGL_ES)
        list(APPEND WebCore_LIBRARIES OpenGL::GLES)
    endif ()

    if (USE_EGL)
        list(APPEND WebCore_SYSTEM_INCLUDE_DIRECTORIES
            ${EGL_INCLUDE_DIRS}
        )
        list(APPEND WebCore_LIBRARIES
            ${EGL_LIBRARIES}
        )
        add_definitions(${EGL_DEFINITIONS})
    endif ()
endif ()

set(WebCoreTestSupport_FRAMEWORKS ${WebCore_FRAMEWORKS})
set(WebCoreTestSupport_DEPENDENCIES WebCoreTestSupportBindings)

if (ENABLE_LEGACY_ENCRYPTED_MEDIA)
    list(APPEND WebCore_SOURCES
        Modules/encryptedmedia/legacy/LegacyCDM.cpp
        Modules/encryptedmedia/legacy/LegacyCDMPrivateClearKey.cpp
        Modules/encryptedmedia/legacy/LegacyCDMPrivateMediaPlayer.cpp
        Modules/encryptedmedia/legacy/LegacyCDMSessionClearKey.cpp

        Modules/encryptedmedia/legacy/WebKitMediaKeyMessageEvent.cpp
        Modules/encryptedmedia/legacy/WebKitMediaKeyNeededEvent.cpp
        Modules/encryptedmedia/legacy/WebKitMediaKeySession.cpp
        Modules/encryptedmedia/legacy/WebKitMediaKeys.cpp
    )
    list(APPEND WebCoreTestSupport_SOURCES
        testing/LegacyMockCDM.cpp
    )
endif ()

list(APPEND WebCore_IDL_FILES
    Modules/encryptedmedia/legacy/WebKitMediaKeyMessageEvent.idl
    Modules/encryptedmedia/legacy/WebKitMediaKeyNeededEvent.idl
    Modules/encryptedmedia/legacy/WebKitMediaKeySession.idl
    Modules/encryptedmedia/legacy/WebKitMediaKeys.idl

    html/WebKitMediaKeyError.idl
)

if (ENABLE_ENCRYPTED_MEDIA)
    list(APPEND WebCore_SOURCES
        Modules/encryptedmedia/CDM.cpp
        Modules/encryptedmedia/InitDataRegistry.cpp
        Modules/encryptedmedia/MediaKeyMessageEvent.cpp
        Modules/encryptedmedia/MediaKeySession.cpp
        Modules/encryptedmedia/MediaKeyStatusMap.cpp
        Modules/encryptedmedia/MediaKeySystemAccess.cpp
        Modules/encryptedmedia/MediaKeySystemController.cpp
        Modules/encryptedmedia/MediaKeySystemRequest.cpp
        Modules/encryptedmedia/MediaKeys.cpp
        Modules/encryptedmedia/NavigatorEME.cpp

        html/MediaEncryptedEvent.cpp
    )

    list(APPEND WebCore_PRIVATE_INCLUDE_DIRECTORIES
        "${WEBCORE_DIR}/platform/encryptedmedia/clearkey"
    )
endif ()

list(APPEND WebCore_CSS_VALUE_KEYWORDS
    ${WEBCORE_DIR}/css/SVGCSSValueKeywords.in
)

if (ENABLE_WEBGL)
    list(APPEND WebCore_SOURCES
        html/canvas/ANGLEInstancedArrays.cpp
        html/canvas/EXTBlendMinMax.cpp
        html/canvas/EXTColorBufferFloat.cpp
        html/canvas/EXTColorBufferHalfFloat.cpp
        html/canvas/EXTFloatBlend.cpp
        html/canvas/EXTFragDepth.cpp
        html/canvas/EXTShaderTextureLOD.cpp
        html/canvas/EXTTextureCompressionBPTC.cpp
        html/canvas/EXTTextureCompressionRGTC.cpp
        html/canvas/EXTTextureFilterAnisotropic.cpp
        html/canvas/EXTTextureNorm16.cpp
        html/canvas/EXTsRGB.cpp
        html/canvas/KHRParallelShaderCompile.cpp
        html/canvas/OESDrawBuffersIndexed.cpp
        html/canvas/OESElementIndexUint.cpp
        html/canvas/OESFBORenderMipmap.cpp
        html/canvas/OESStandardDerivatives.cpp
        html/canvas/OESTextureFloat.cpp
        html/canvas/OESTextureFloatLinear.cpp
        html/canvas/OESTextureHalfFloat.cpp
        html/canvas/OESTextureHalfFloatLinear.cpp
        html/canvas/OESVertexArrayObject.cpp
        html/canvas/WebGL2RenderingContext.cpp
        html/canvas/WebGLBuffer.cpp
        html/canvas/WebGLColorBufferFloat.cpp
        html/canvas/WebGLCompressedTextureASTC.cpp
        html/canvas/WebGLCompressedTextureATC.cpp
        html/canvas/WebGLCompressedTextureETC.cpp
        html/canvas/WebGLCompressedTextureETC1.cpp
        html/canvas/WebGLCompressedTexturePVRTC.cpp
        html/canvas/WebGLCompressedTextureS3TC.cpp
        html/canvas/WebGLCompressedTextureS3TCsRGB.cpp
        html/canvas/WebGLContextEvent.cpp
        html/canvas/WebGLContextGroup.cpp
        html/canvas/WebGLContextObject.cpp
        html/canvas/WebGLDebugRendererInfo.cpp
        html/canvas/WebGLDebugShaders.cpp
        html/canvas/WebGLDepthTexture.cpp
        html/canvas/WebGLDrawBuffers.cpp
        html/canvas/WebGLDrawInstancedBaseVertexBaseInstance.cpp
        html/canvas/WebGLExtension.cpp
        html/canvas/WebGLFramebuffer.cpp
        html/canvas/WebGLLoseContext.cpp
        html/canvas/WebGLMultiDraw.cpp
        html/canvas/WebGLMultiDrawInstancedBaseVertexBaseInstance.cpp
        html/canvas/WebGLObject.cpp
        html/canvas/WebGLProgram.cpp
        html/canvas/WebGLProvokingVertex.cpp
        html/canvas/WebGLQuery.cpp
        html/canvas/WebGLRenderbuffer.cpp
        html/canvas/WebGLRenderingContext.cpp
        html/canvas/WebGLRenderingContextBase.cpp
        html/canvas/WebGLSampler.cpp
        html/canvas/WebGLShader.cpp
        html/canvas/WebGLShaderPrecisionFormat.cpp
        html/canvas/WebGLSharedObject.cpp
        html/canvas/WebGLSync.cpp
        html/canvas/WebGLTexture.cpp
        html/canvas/WebGLTransformFeedback.cpp
        html/canvas/WebGLUniformLocation.cpp
        html/canvas/WebGLVertexArrayObject.cpp
        html/canvas/WebGLVertexArrayObjectBase.cpp
        html/canvas/WebGLVertexArrayObjectOES.cpp
    )
endif ()

list(APPEND WebCore_IDL_FILES
    html/canvas/ANGLEInstancedArrays.idl
    html/canvas/EXTBlendMinMax.idl
    html/canvas/EXTColorBufferFloat.idl
    html/canvas/EXTColorBufferHalfFloat.idl
    html/canvas/EXTFloatBlend.idl
    html/canvas/EXTFragDepth.idl
    html/canvas/EXTShaderTextureLOD.idl
    html/canvas/EXTTextureCompressionBPTC.idl
    html/canvas/EXTTextureCompressionRGTC.idl
    html/canvas/EXTTextureFilterAnisotropic.idl
    html/canvas/EXTTextureNorm16.idl
    html/canvas/EXTsRGB.idl
    html/canvas/KHRParallelShaderCompile.idl
    html/canvas/OESDrawBuffersIndexed.idl
    html/canvas/OESElementIndexUint.idl
    html/canvas/OESFBORenderMipmap.idl
    html/canvas/OESStandardDerivatives.idl
    html/canvas/OESTextureFloat.idl
    html/canvas/OESTextureFloatLinear.idl
    html/canvas/OESTextureHalfFloat.idl
    html/canvas/OESTextureHalfFloatLinear.idl
    html/canvas/OESVertexArrayObject.idl
    html/canvas/WebGL2RenderingContext.idl
    html/canvas/WebGLActiveInfo.idl
    html/canvas/WebGLBuffer.idl
    html/canvas/WebGLColorBufferFloat.idl
    html/canvas/WebGLCompressedTextureASTC.idl
    html/canvas/WebGLCompressedTextureATC.idl
    html/canvas/WebGLCompressedTextureETC.idl
    html/canvas/WebGLCompressedTextureETC1.idl
    html/canvas/WebGLCompressedTexturePVRTC.idl
    html/canvas/WebGLCompressedTextureS3TC.idl
    html/canvas/WebGLCompressedTextureS3TCsRGB.idl
    html/canvas/WebGLContextAttributes.idl
    html/canvas/WebGLContextEvent.idl
    html/canvas/WebGLDebugRendererInfo.idl
    html/canvas/WebGLDebugShaders.idl
    html/canvas/WebGLDepthTexture.idl
    html/canvas/WebGLDrawBuffers.idl
    html/canvas/WebGLDrawInstancedBaseVertexBaseInstance.idl
    html/canvas/WebGLFramebuffer.idl
    html/canvas/WebGLLoseContext.idl
    html/canvas/WebGLMultiDraw.idl
    html/canvas/WebGLMultiDrawInstancedBaseVertexBaseInstance.idl
    html/canvas/WebGLProgram.idl
    html/canvas/WebGLProvokingVertex.idl
    html/canvas/WebGLQuery.idl
    html/canvas/WebGLRenderbuffer.idl
    html/canvas/WebGLRenderingContext.idl
    html/canvas/WebGLRenderingContextBase.idl
    html/canvas/WebGLSampler.idl
    html/canvas/WebGLShader.idl
    html/canvas/WebGLShaderPrecisionFormat.idl
    html/canvas/WebGLSync.idl
    html/canvas/WebGLTexture.idl
    html/canvas/WebGLTransformFeedback.idl
    html/canvas/WebGLUniformLocation.idl
    html/canvas/WebGLVertexArrayObject.idl
    html/canvas/WebGLVertexArrayObjectOES.idl
)

if (ENABLE_WEBGL)
    list(APPEND WebCore_SOURCES
        platform/graphics/FormatConverter.cpp
    )

    list(APPEND WebCore_PRIVATE_INCLUDE_DIRECTORIES
        ${WEBCORE_DIR}/platform/graphics/angle
    )
    list(APPEND WebCore_SOURCES
        platform/graphics/angle/ANGLEUtilities.cpp
        platform/graphics/angle/GraphicsContextGLANGLE.cpp
    )

    list(APPEND WebCore_LIBRARIES ANGLE::GLES)
elseif (USE_ANGLE_EGL)
    list(APPEND WebCore_PRIVATE_INCLUDE_DIRECTORIES
        ${WEBCORE_DIR}/platform/graphics/angle
        ${WEBCORE_DIR}/platform/graphics/opengl
    )

    list(APPEND WebCore_SOURCES
        platform/graphics/opengl/TemporaryOpenGLSetting.cpp
    )
endif ()

list(APPEND WebCore_IDL_FILES
    page/UserMessageHandler.idl
    page/UserMessageHandlersNamespace.idl
    page/WebKitNamespace.idl
)

if (ENABLE_USER_MESSAGE_HANDLERS)
    list(APPEND WebCore_SOURCES
        page/UserMessageHandler.cpp
        page/UserMessageHandlerDescriptor.cpp
        page/UserMessageHandlersNamespace.cpp
        page/WebKitNamespace.cpp
    )
endif ()

if (USE_LCMS)
    list(APPEND WebCore_PRIVATE_INCLUDE_DIRECTORIES
        "${WEBCORE_DIR}/platform/graphics/lcms"
    )

    list(APPEND WebCore_PRIVATE_FRAMEWORK_HEADERS
        platform/graphics/lcms/LCMSUniquePtr.h
    )

    list(APPEND WebCore_LIBRARIES LCMS2::LCMS2)
endif ()

if (USE_WOFF2)
  list(APPEND WebCore_LIBRARIES WOFF2::dec)
endif ()

if (USE_XDGMIME)
    list(APPEND WebCore_PRIVATE_INCLUDE_DIRECTORIES "${THIRDPARTY_DIR}/xdgmime/src")
    list(APPEND WebCore_LIBRARIES xdgmime)
endif ()

if (USE_LIBWEBRTC)
    list(APPEND WebCore_SYSTEM_INCLUDE_DIRECTORIES "${THIRDPARTY_DIR}/libwebrtc/Source/"
        "${THIRDPARTY_DIR}/libwebrtc/Source/webrtc"
        "${THIRDPARTY_DIR}/libwebrtc/Source/third_party/libvpx/source/libvpx"
        "${THIRDPARTY_DIR}/libwebrtc/Source/third_party/abseil-cpp")
    list(APPEND WebCore_LIBRARIES webrtc)
    list(APPEND WebCore_SOURCES
        Modules/mediastream/libwebrtc/LibWebRTCDataChannelHandler.cpp
        Modules/mediastream/libwebrtc/LibWebRTCMediaEndpoint.cpp
        Modules/mediastream/libwebrtc/LibWebRTCPeerConnectionBackend.cpp
        Modules/mediastream/libwebrtc/LibWebRTCRtpReceiverBackend.cpp
        Modules/mediastream/libwebrtc/LibWebRTCRtpSenderBackend.cpp
        Modules/mediastream/libwebrtc/LibWebRTCRtpTransceiverBackend.cpp
        Modules/mediastream/libwebrtc/LibWebRTCStatsCollector.cpp
        Modules/mediastream/libwebrtc/LibWebRTCUtils.cpp
    )
endif ()

if (HAVE_OS_DARK_MODE_SUPPORT)
    set(FEATURE_DEFINES_WITH_SPACE_SEPARATOR "${FEATURE_DEFINES_WITH_SPACE_SEPARATOR} HAVE_OS_DARK_MODE_SUPPORT")
endif ()

set(WebCoreTestSupport_PRIVATE_INCLUDE_DIRECTORIES
    "${WEBCORE_DIR}/platform/mock"
    "${WEBCORE_DIR}/testing"
    "${WebCore_DERIVED_SOURCES_DIR}"
)

if (CMAKE_VERSION VERSION_GREATER_EQUAL 3.18)
    set(CAT_PROGRAM ${CMAKE_COMMAND} -E cat)
else ()
    set(CAT_PROGRAM cat)
endif ()

set(SUPPLEMENTAL_DEPENDENCY_FILE ${WebCore_DERIVED_SOURCES_DIR}/supplemental_dependency.tmp)
set(ISO_SUBSPACES_HEADER_FILE ${WebCore_DERIVED_SOURCES_DIR}/DOMIsoSubspaces.h)
set(CLIENT_ISO_SUBSPACES_HEADER_FILE ${WebCore_DERIVED_SOURCES_DIR}/DOMClientIsoSubspaces.h)
set(CONSTRUCTORS_HEADER_FILE ${WebCore_DERIVED_SOURCES_DIR}/DOMConstructors.h)
set(WINDOW_CONSTRUCTORS_FILE ${WebCore_DERIVED_SOURCES_DIR}/DOMWindowConstructors.idl)
set(WORKERGLOBALSCOPE_CONSTRUCTORS_FILE ${WebCore_DERIVED_SOURCES_DIR}/WorkerGlobalScopeConstructors.idl)
set(SHADOWREALMGLOBALSCOPE_CONSTRUCTORS_FILE ${WebCore_DERIVED_SOURCES_DIR}/ShadowRealmGlobalScopeConstructors.idl)
set(DEDICATEDWORKERGLOBALSCOPE_CONSTRUCTORS_FILE ${WebCore_DERIVED_SOURCES_DIR}/DedicatedWorkerGlobalScopeConstructors.idl)
set(SERVICEWORKERGLOBALSCOPE_CONSTRUCTORS_FILE ${WebCore_DERIVED_SOURCES_DIR}/ServiceWorkerGlobalScopeConstructors.idl)
set(SHAREDWORKERGLOBALSCOPE_CONSTRUCTORS_FILE ${WebCore_DERIVED_SOURCES_DIR}/SharedWorkerGlobalScopeConstructors.idl)
set(WORKLETGLOBALSCOPE_CONSTRUCTORS_FILE ${WebCore_DERIVED_SOURCES_DIR}/WorkletGlobalScopeConstructors.idl)
set(PAINTWORKLETGLOBALSCOPE_CONSTRUCTORS_FILE ${WebCore_DERIVED_SOURCES_DIR}/PaintWorkletGlobalScopeConstructors.idl)
set(AUDIOWORKLETGLOBALSCOPE_CONSTRUCTORS_FILE ${WebCore_DERIVED_SOURCES_DIR}/AudioWorkletGlobalScopeConstructors.idl)

set(WebCore_INTERFACE_LIBRARIES WebCore)
set(WebCore_INTERFACE_INCLUDE_DIRECTORIES ${WebCore_PRIVATE_FRAMEWORK_HEADERS_DIR})

set(WebCoreTestSupport_INTERFACE_LIBRARIES WebCoreTestSupport)
set(WebCoreTestSupport_INTERFACE_INCLUDE_DIRECTORIES
    ${WebCore_PRIVATE_FRAMEWORK_HEADERS_DIR}/WebCoreTestSupport
)

WEBKIT_FRAMEWORK_DECLARE(WebCore)
WEBKIT_FRAMEWORK_DECLARE(WebCoreTestSupport)
WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()

MAKE_HASH_TOOLS(${WEBCORE_DIR}/platform/ColorData)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/ColorData.cpp)

# Generate HTML entity table
add_custom_command(
    OUTPUT ${WebCore_DERIVED_SOURCES_DIR}/HTMLEntityTable.cpp
    MAIN_DEPENDENCY ${WEBCORE_DIR}/html/parser/HTMLEntityNames.in
    DEPENDS ${WEBCORE_DIR}/html/parser/create-html-entity-table
    COMMAND ${PYTHON_EXECUTABLE} ${WEBCORE_DIR}/html/parser/create-html-entity-table -o ${WebCore_DERIVED_SOURCES_DIR}/HTMLEntityTable.cpp ${WEBCORE_DIR}/html/parser/HTMLEntityNames.in
    VERBATIM)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/HTMLEntityTable.cpp)

# Generate HTTP header names
add_custom_command(
    OUTPUT ${WebCore_DERIVED_SOURCES_DIR}/HTTPHeaderNames.cpp ${WebCore_DERIVED_SOURCES_DIR}/HTTPHeaderNames.gperf ${WebCore_DERIVED_SOURCES_DIR}/HTTPHeaderNames.h
    MAIN_DEPENDENCY ${WEBCORE_DIR}/platform/network/HTTPHeaderNames.in
    DEPENDS ${WEBCORE_DIR}/platform/network/create-http-header-name-table
    WORKING_DIRECTORY ${WebCore_DERIVED_SOURCES_DIR}
    COMMAND ${PYTHON_EXECUTABLE} ${WEBCORE_DIR}/platform/network/create-http-header-name-table ${WEBCORE_DIR}/platform/network/HTTPHeaderNames.in "${GPERF_EXECUTABLE}"
    VERBATIM)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/HTTPHeaderNames.cpp)

# Generate CSS property names
add_custom_command(
    OUTPUT ${WebCore_DERIVED_SOURCES_DIR}/CSSProperties.json ${WebCore_DERIVED_SOURCES_DIR}/CSSPropertyNames.h ${WebCore_DERIVED_SOURCES_DIR}/CSSPropertyNames.cpp ${WebCore_DERIVED_SOURCES_DIR}/CSSPropertyNames.gperf ${WebCore_DERIVED_SOURCES_DIR}/StyleBuilderGenerated.cpp ${WebCore_DERIVED_SOURCES_DIR}/StylePropertyShorthandFunctions.h ${WebCore_DERIVED_SOURCES_DIR}/StylePropertyShorthandFunctions.cpp ${WebCore_DERIVED_SOURCES_DIR}/CSSStyleDeclaration+PropertyNames.idl
    MAIN_DEPENDENCY ${WEBCORE_DIR}/css/makeprop.pl
    DEPENDS ${WebCore_CSS_PROPERTY_NAMES}
    WORKING_DIRECTORY ${WebCore_DERIVED_SOURCES_DIR}
    COMMAND ${PERL_EXECUTABLE} -ne "print" ${WebCore_CSS_PROPERTY_NAMES} > ${WebCore_DERIVED_SOURCES_DIR}/CSSProperties.json
    COMMAND ${PERL_EXECUTABLE} ${WEBCORE_DIR}/css/makeprop.pl --defines "${FEATURE_DEFINES_WITH_SPACE_SEPARATOR}" --gperf-executable "${GPERF_EXECUTABLE}"
    VERBATIM)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/CSSPropertyNames.cpp)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/StyleBuilderGenerated.cpp)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/StylePropertyShorthandFunctions.cpp)
list(APPEND WebCore_IDL_FILES ${WebCore_DERIVED_SOURCES_DIR}/CSSStyleDeclaration+PropertyNames.idl)

# Generate CSS value keywords
add_custom_command(
    OUTPUT ${WebCore_DERIVED_SOURCES_DIR}/CSSValueKeywords.in ${WebCore_DERIVED_SOURCES_DIR}/CSSValueKeywords.h ${WebCore_DERIVED_SOURCES_DIR}/CSSValueKeywords.cpp ${WebCore_DERIVED_SOURCES_DIR}/CSSValueKeywords.gperf
    MAIN_DEPENDENCY ${WEBCORE_DIR}/css/makevalues.pl
    DEPENDS ${WebCore_CSS_VALUE_KEYWORDS}
    WORKING_DIRECTORY ${WebCore_DERIVED_SOURCES_DIR}
    COMMAND ${PERL_EXECUTABLE} -ne "print" ${WebCore_CSS_VALUE_KEYWORDS} > ${WebCore_DERIVED_SOURCES_DIR}/CSSValueKeywords.in
    COMMAND ${PERL_EXECUTABLE} ${WEBCORE_DIR}/css/makevalues.pl --defines "${FEATURE_DEFINES_WITH_SPACE_SEPARATOR} ${CSS_VALUE_PLATFORM_DEFINES}" --preprocessor "${CODE_GENERATOR_PREPROCESSOR}" --gperf-executable "${GPERF_EXECUTABLE}"
    VERBATIM)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/CSSValueKeywords.cpp)
ADD_SOURCE_WEBCORE_DERIVED_DEPENDENCIES(${WEBCORE_DIR}/css/parser/CSSParser.cpp CSSValueKeywords.h)
ADD_SOURCE_WEBCORE_DERIVED_DEPENDENCIES(${WEBCORE_DIR}/css/CSSPrimitiveValueMappings.h CSSValueKeywords.h)

# Generate CSS Selector pseudo type name to value maps.
add_custom_command(
    OUTPUT ${WebCore_DERIVED_SOURCES_DIR}/SelectorPseudoClassAndCompatibilityElementMap.gperf ${WebCore_DERIVED_SOURCES_DIR}/SelectorPseudoClassAndCompatibilityElementMap.cpp
    MAIN_DEPENDENCY ${WEBCORE_DIR}/css/SelectorPseudoClassAndCompatibilityElementMap.in
    DEPENDS ${WEBCORE_DIR}/css/makeSelectorPseudoClassAndCompatibilityElementMap.py
    WORKING_DIRECTORY ${WebCore_DERIVED_SOURCES_DIR}
    COMMAND ${PYTHON_EXECUTABLE} ${WEBCORE_DIR}/css/makeSelectorPseudoClassAndCompatibilityElementMap.py ${WEBCORE_DIR}/css/SelectorPseudoClassAndCompatibilityElementMap.in "${GPERF_EXECUTABLE}" "${FEATURE_DEFINES_WITH_SPACE_SEPARATOR}"
    VERBATIM)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/SelectorPseudoClassAndCompatibilityElementMap.cpp)
add_custom_command(
    OUTPUT ${WebCore_DERIVED_SOURCES_DIR}/SelectorPseudoElementTypeMap.gperf ${WebCore_DERIVED_SOURCES_DIR}/SelectorPseudoElementTypeMap.cpp
    MAIN_DEPENDENCY ${WEBCORE_DIR}/css/SelectorPseudoElementTypeMap.in
    DEPENDS ${WEBCORE_DIR}/css/makeSelectorPseudoElementsMap.py
    WORKING_DIRECTORY ${WebCore_DERIVED_SOURCES_DIR}
    COMMAND ${PYTHON_EXECUTABLE} ${WEBCORE_DIR}/css/makeSelectorPseudoElementsMap.py ${WEBCORE_DIR}/css/SelectorPseudoElementTypeMap.in "${GPERF_EXECUTABLE}" "${FEATURE_DEFINES_WITH_SPACE_SEPARATOR}"
    VERBATIM)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/SelectorPseudoElementTypeMap.cpp)

list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/UserAgentStyleSheetsData.cpp)
ADD_SOURCE_WEBCORE_DERIVED_DEPENDENCIES(${WEBCORE_DIR}/style/StyleResolver.cpp UserAgentStyleSheetsData.cpp UserAgentStyleSheets.h)
ADD_SOURCE_WEBCORE_DERIVED_DEPENDENCIES(${WEBCORE_DIR}/style/UserAgentStyle.cpp UserAgentStyleSheetsData.cpp UserAgentStyleSheets.h)

if (WebCore_USER_AGENT_SCRIPTS)
    # Necessary variables:
    # WebCore_USER_AGENT_SCRIPTS containing the JavaScript sources list
    # WebCore_USER_AGENT_SCRIPTS_DEPENDENCIES containing the source file that will load the scripts to add the proper
    #   dependency and having them built at the right moment

    MAKE_JS_FILE_ARRAYS(
        ${WebCore_DERIVED_SOURCES_DIR}/UserAgentScriptsData.cpp
        ${WebCore_DERIVED_SOURCES_DIR}/UserAgentScripts.h
        WebCore
        WebCore_USER_AGENT_SCRIPTS
        WebCore_USER_AGENT_SCRIPTS_DEPENDENCIES
    )
    list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/UserAgentScriptsData.cpp)
endif ()

GENERATE_SETTINGS_MACROS(${WEBCORE_DIR}/page/Settings.yaml Settings.h)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/Settings.h)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/Settings.cpp)
list(APPEND WebCoreTestSupport_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/InternalSettingsGenerated.cpp)
list(APPEND WebCoreTestSupport_IDL_FILES ${WebCore_DERIVED_SOURCES_DIR}/InternalSettingsGenerated.idl)

ADD_SOURCE_WEBCORE_DERIVED_DEPENDENCIES(${WEBCORE_DIR}/html/parser/HTMLTreeBuilder.cpp MathMLNames.cpp)


GENERATE_DOM_NAMES(HTML ${WEBCORE_DIR}/html/HTMLAttributeNames.in ${WEBCORE_DIR}/html/HTMLTagNames.in)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/HTMLNames.cpp ${WebCore_DERIVED_SOURCES_DIR}/HTMLElementFactory.cpp ${WebCore_DERIVED_SOURCES_DIR}/JSHTMLElementWrapperFactory.cpp)


GENERATE_EVENT_FACTORY(${WEBCORE_DIR}/dom/EventNames.in Event)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/EventInterfaces.h)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/EventFactory.cpp)


GENERATE_EVENT_FACTORY(${WEBCORE_DIR}/dom/EventTargetFactory.in EventTarget)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/EventTargetInterfaces.h)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/EventTargetFactory.cpp)


GENERATE_FONT_NAMES(${WEBCORE_DIR}/css/WebKitFontFamilyNames.in)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/WebKitFontFamilyNames.cpp)


GENERATE_DOM_NAMES(MathML ${WEBCORE_DIR}/mathml/mathattrs.in ${WEBCORE_DIR}/mathml/mathtags.in)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/MathMLNames.cpp)
if (ENABLE_MATHML)
    list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/MathMLElementFactory.cpp)
endif ()

GENERATE_DOM_NAMES(SVG ${WEBCORE_DIR}/svg/svgattrs.in ${WEBCORE_DIR}/svg/svgtags.in)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/SVGNames.cpp)

list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/SVGElementFactory.cpp ${WebCore_DERIVED_SOURCES_DIR}/JSSVGElementWrapperFactory.cpp)

GENERATE_DOM_NAMES(XLink ${WEBCORE_DIR}/svg/xlinkattrs.in)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/XLinkNames.cpp)


GENERATE_DOM_NAMES(XMLNS ${WEBCORE_DIR}/xml/xmlnsattrs.in)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/XMLNSNames.cpp)

GENERATE_DOM_NAMES(XML ${WEBCORE_DIR}/xml/xmlattrs.in)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/XMLNames.cpp)

GENERATE_DOM_NAME_ENUM(TagName)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/TagName.cpp)

GENERATE_DOM_NAME_ENUM(ElementName)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/ElementName.cpp)

GENERATE_DOM_NAME_ENUM(Namespace)
list(APPEND WebCore_SOURCES ${WebCore_DERIVED_SOURCES_DIR}/Namespace.cpp)

WEBKIT_COMPUTE_SOURCES(WebCore)

if (MSVC)
    WEBKIT_ADD_PRECOMPILED_HEADER("WebCorePrefix.h" "WebCorePrefix.cpp" WebCore_SOURCES)
endif ()

WEBKIT_COPY_FILES(WebCore_CopyPrivateHeaders
    DESTINATION ${WebCore_PRIVATE_FRAMEWORK_HEADERS_DIR}/WebCore
    FILES ${WebCore_PRIVATE_FRAMEWORK_HEADERS}
    FLATTENED
)
list(APPEND WebCore_INTERFACE_DEPENDENCIES WebCore_CopyPrivateHeaders)
# WebCore_CopyPrivateHeaders needs to have a direct or indirect
# dependency of WebCore target for CMake Visual Studio generator to
# eliminate duplicated custom commands. Otherwise, CSSPropertyNames.h
# will be generated in both projects.
if (NOT INTERNAL_BUILD)
    add_dependencies(WebCore_CopyPrivateHeaders WebCore)
endif ()

WEBKIT_FRAMEWORK(WebCore)
WEBKIT_FRAMEWORK_TARGET(WebCore)

if (APPLE)
    set_target_properties(WebCore PROPERTIES LINK_FLAGS "-sub_library libobjc -umbrella WebKit -allowable_client WebCoreTestSupport -allowable_client WebKit2 -allowable_client WebKitLegacy")
endif ()

# The -ftree-sra optimization (implicit with -O2) causes crashes when
# allocating large chunks of memory using bmalloc on Intel 32bit.
# See https://bugs.webkit.org/show_bug.cgi?id=146440
string(TOLOWER ${CMAKE_HOST_SYSTEM_PROCESSOR} LOWERCASE_CMAKE_HOST_SYSTEM_PROCESSOR)
if (CMAKE_COMPILER_IS_GNUCXX AND "${LOWERCASE_CMAKE_HOST_SYSTEM_PROCESSOR}" MATCHES "(i[3-6]86|x86)$")
    WEBKIT_ADD_TARGET_CXX_FLAGS(WebCore -fno-tree-sra)
endif ()

if (MSVC)
    WEBKIT_ADD_PRECOMPILED_HEADER("WebCoreTestSupportPrefix.h" "testing/js/WebCoreTestSupportPrefix.cpp" WebCoreTestSupport_SOURCES)
endif ()

WEBKIT_COPY_FILES(Copy_WebCoreTestSupportPrivateHeaders
    DESTINATION ${WebCore_PRIVATE_FRAMEWORK_HEADERS_DIR}/WebCoreTestSupport
    FILES ${WebCoreTestSupport_PRIVATE_HEADERS}
    FLATTENED
)
list(APPEND WebCoreTestSupport_INTERFACE_DEPENDENCIES Copy_WebCoreTestSupportPrivateHeaders)

list(APPEND WebCoreTestSupport_INCLUDE_DIRECTORIES ${WebCore_INCLUDE_DIRECTORIES})
list(APPEND WebCoreTestSupport_PRIVATE_INCLUDE_DIRECTORIES ${WebCore_PRIVATE_INCLUDE_DIRECTORIES})
list(APPEND WebCoreTestSupport_SYSTEM_INCLUDE_DIRECTORIES ${WebCore_SYSTEM_INCLUDE_DIRECTORIES})

if (WebCore_LIBRARY_TYPE STREQUAL SHARED)
    list(APPEND WebCoreTestSupport_PRIVATE_LIBRARIES WebCore)
else ()
    list(APPEND WebCoreTestSupport_LIBRARIES ${WebCore_LIBRARIES})
    list(APPEND WebCoreTestSupport_PRIVATE_LIBRARIES ${WebCore_PRIVATE_LIBRARIES})
    list(APPEND WebCoreTestSupport_DEPENDENCIES WebCore)
endif ()

if (${WebCore_LIBRARY_TYPE} MATCHES "SHARED")
    set_target_properties(WebCore PROPERTIES VERSION ${PROJECT_VERSION} SOVERSION ${PROJECT_VERSION_MAJOR})
    install(TARGETS WebCore DESTINATION "${LIB_INSTALL_DIR}")
endif ()

if (MSVC)
    set_target_properties(WebCore PROPERTIES
        COMPILE_PDB_NAME ${WebCore_OUTPUT_NAME}
    )
endif ()
