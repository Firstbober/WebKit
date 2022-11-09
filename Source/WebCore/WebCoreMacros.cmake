macro(MAKE_HASH_TOOLS _source)
    get_filename_component(_name ${_source} NAME_WE)

    if (${_source} STREQUAL "DocTypeStrings")
        set(_hash_tools_h "${WebCore_DERIVED_SOURCES_DIR}/HashTools.h")
    else ()
        set(_hash_tools_h "")
    endif ()

    add_custom_command(
        OUTPUT ${WebCore_DERIVED_SOURCES_DIR}/${_name}.cpp ${_hash_tools_h}
        MAIN_DEPENDENCY ${_source}.gperf
        COMMAND ${PERL_EXECUTABLE} ${WEBCORE_DIR}/make-hash-tools.pl ${WebCore_DERIVED_SOURCES_DIR} ${_source}.gperf ${GPERF_EXECUTABLE}
        VERBATIM)

    unset(_name)
    unset(_hash_tools_h)
endmacro()


# Append the given dependencies to the source file
# This one consider the given dependencies are in ${WebCore_DERIVED_SOURCES_DIR}
# and prepends this to every member of dependencies list
macro(ADD_SOURCE_WEBCORE_DERIVED_DEPENDENCIES _source _deps)
    set(_tmp "")
    foreach (f ${_deps})
        list(APPEND _tmp "${WebCore_DERIVED_SOURCES_DIR}/${f}")
    endforeach ()

    WEBKIT_ADD_SOURCE_DEPENDENCIES(${_source} ${_tmp})
    unset(_tmp)
endmacro()


macro(MAKE_JS_FILE_ARRAYS _output_cpp _output_h _namespace _scripts _scripts_dependencies)
    add_custom_command(
        OUTPUT ${_output_h} ${_output_cpp}
        DEPENDS ${JavaScriptCore_SCRIPTS_DIR}/make-js-file-arrays.py ${${_scripts}}
        COMMAND ${PYTHON_EXECUTABLE} ${JavaScriptCore_SCRIPTS_DIR}/make-js-file-arrays.py --fail-if-non-ascii -n ${_namespace} ${_output_h} ${_output_cpp} ${${_scripts}}
        VERBATIM)
    WEBKIT_ADD_SOURCE_DEPENDENCIES(${${_scripts_dependencies}} ${_output_h} ${_output_cpp})
endmacro()

option(SHOW_BINDINGS_GENERATION_PROGRESS "Show progress of generating bindings" OFF)

macro(GENERATE_FONT_NAMES _infile)
    set(NAMES_GENERATOR ${WEBCORE_DIR}/dom/make_names.pl)
    set(_arguments  --fonts ${_infile})
    set(_outputfiles ${WebCore_DERIVED_SOURCES_DIR}/WebKitFontFamilyNames.cpp ${WebCore_DERIVED_SOURCES_DIR}/WebKitFontFamilyNames.h)

    add_custom_command(
        OUTPUT  ${_outputfiles}
        MAIN_DEPENDENCY ${_infile}
        DEPENDS ${MAKE_NAMES_DEPENDENCIES} ${NAMES_GENERATOR} ${SCRIPTS_BINDINGS}
        COMMAND ${PERL_EXECUTABLE} ${NAMES_GENERATOR} --outputDir ${WebCore_DERIVED_SOURCES_DIR} ${_arguments}
        VERBATIM)
endmacro()


macro(GENERATE_EVENT_FACTORY _infile _namespace)
    set(NAMES_GENERATOR ${WEBCORE_DIR}/dom/make_event_factory.pl)
    set(_outputfiles ${WebCore_DERIVED_SOURCES_DIR}/${_namespace}Interfaces.h ${WebCore_DERIVED_SOURCES_DIR}/${_namespace}Factory.cpp)

    add_custom_command(
        OUTPUT  ${_outputfiles}
        MAIN_DEPENDENCY ${_infile}
        DEPENDS ${NAMES_GENERATOR} ${SCRIPTS_BINDINGS}
        COMMAND ${PERL_EXECUTABLE} ${NAMES_GENERATOR} --input ${_infile} --outputDir ${WebCore_DERIVED_SOURCES_DIR}
        VERBATIM)
endmacro()


macro(GENERATE_SETTINGS_MACROS _infile _outfile)
    set(NAMES_GENERATOR ${WEBCORE_DIR}/Scripts/GenerateSettings.rb)

    set(_extra_output
        ${WebCore_DERIVED_SOURCES_DIR}/Settings.cpp
        ${WebCore_DERIVED_SOURCES_DIR}/InternalSettingsGenerated.h
        ${WebCore_DERIVED_SOURCES_DIR}/InternalSettingsGenerated.cpp
        ${WebCore_DERIVED_SOURCES_DIR}/InternalSettingsGenerated.idl
    )

    set(GENERATE_SETTINGS_SCRIPTS
        ${WEBCORE_DIR}/Scripts/SettingsTemplates/InternalSettingsGenerated.cpp.erb
        ${WEBCORE_DIR}/Scripts/SettingsTemplates/InternalSettingsGenerated.idl.erb
        ${WEBCORE_DIR}/Scripts/SettingsTemplates/InternalSettingsGenerated.h.erb
        ${WEBCORE_DIR}/Scripts/SettingsTemplates/Settings.cpp.erb
        ${WEBCORE_DIR}/Scripts/SettingsTemplates/Settings.h.erb
    )

    set(WTF_WEB_PREFERENCES
        ${WTF_SCRIPTS_DIR}/Preferences/WebPreferences.yaml
        ${WTF_SCRIPTS_DIR}/Preferences/WebPreferencesDebug.yaml
        ${WTF_SCRIPTS_DIR}/Preferences/WebPreferencesExperimental.yaml
        ${WTF_SCRIPTS_DIR}/Preferences/WebPreferencesInternal.yaml
    )

    set_source_files_properties(${WTF_WEB_PREFERENCES} PROPERTIES GENERATED TRUE)

    add_custom_command(
        OUTPUT ${WebCore_DERIVED_SOURCES_DIR}/${_outfile} ${_extra_output}
        MAIN_DEPENDENCY ${_infile}
        DEPENDS ${NAMES_GENERATOR} ${GENERATE_SETTINGS_SCRIPTS} ${SCRIPTS_BINDINGS} ${WTF_WEB_PREFERENCES} WTF_CopyPreferences
        COMMAND ${RUBY_EXECUTABLE} ${NAMES_GENERATOR} --additionalSettings ${_infile} --base ${WTF_SCRIPTS_DIR}/Preferences/WebPreferences.yaml --debug ${WTF_SCRIPTS_DIR}/Preferences/WebPreferencesDebug.yaml --experimental ${WTF_SCRIPTS_DIR}/Preferences/WebPreferencesExperimental.yaml --internal ${WTF_SCRIPTS_DIR}/Preferences/WebPreferencesInternal.yaml --outputDir ${WebCore_DERIVED_SOURCES_DIR} --template ${WEBCORE_DIR}/Scripts/SettingsTemplates/InternalSettingsGenerated.cpp.erb --template ${WEBCORE_DIR}/Scripts/SettingsTemplates/InternalSettingsGenerated.idl.erb --template ${WEBCORE_DIR}/Scripts/SettingsTemplates/InternalSettingsGenerated.h.erb --template ${WEBCORE_DIR}/Scripts/SettingsTemplates/Settings.cpp.erb --template ${WEBCORE_DIR}/Scripts/SettingsTemplates/Settings.h.erb
        VERBATIM ${_args})
endmacro()


function(GENERATE_DOM_NAMES _namespace _attrs)
    if (ARGN)
        list(GET ARGN 0 _elements)
        list(REMOVE_AT ARGN 0)
    endif ()
    set(NAMES_GENERATOR ${WEBCORE_DIR}/dom/make_names.pl)
    set(_arguments  --attrs ${_attrs})
    set(_outputfiles ${WebCore_DERIVED_SOURCES_DIR}/${_namespace}Names.cpp ${WebCore_DERIVED_SOURCES_DIR}/${_namespace}Names.h)

    if (_elements)
        set(_arguments "${_arguments}" --elements ${_elements} --factory --wrapperFactory)
        set(_outputfiles "${_outputfiles}" ${WebCore_DERIVED_SOURCES_DIR}/${_namespace}ElementFactory.cpp ${WebCore_DERIVED_SOURCES_DIR}/${_namespace}ElementFactory.h ${WebCore_DERIVED_SOURCES_DIR}/${_namespace}ElementTypeHelpers.h ${WebCore_DERIVED_SOURCES_DIR}/JS${_namespace}ElementWrapperFactory.cpp ${WebCore_DERIVED_SOURCES_DIR}/JS${_namespace}ElementWrapperFactory.h)
    endif ()

    add_custom_command(
        OUTPUT  ${_outputfiles}
        DEPENDS ${MAKE_NAMES_DEPENDENCIES} ${NAMES_GENERATOR} ${SCRIPTS_BINDINGS} ${_attrs} ${_elements}
        COMMAND ${PERL_EXECUTABLE} ${NAMES_GENERATOR} --outputDir ${WebCore_DERIVED_SOURCES_DIR} ${_arguments} ${_additionArguments}
        VERBATIM)
endfunction()


function(GENERATE_DOM_NAME_ENUM _enum)
    add_custom_command(
        OUTPUT ${WebCore_DERIVED_SOURCES_DIR}/${_enum}.cpp ${WebCore_DERIVED_SOURCES_DIR}/${_enum}.h
        MAIN_DEPENDENCY ${WEBCORE_DIR}/html/HTMLTagNames.in ${WEBCORE_DIR}/svg/svgtags.in ${WEBCORE_DIR}/mathml/mathtags.in ${WEBCORE_DIR}/html/HTMLAttributeNames.in ${WEBCORE_DIR}/mathml/mathatrs.in ${WEBCORE_DIR}/svg/svgattrs.in ${WEBCORE_DIR}/svg/xlinkattrs.in ${WEBCORE_DIR}/xml/xmlattrs.in ${WEBCORE_DIR}/xml/xmlnsattrs.in
        DEPENDS ${MAKE_NAMES_DEPENDENCIES} ${WEBCORE_DIR}/dom/make_names.pl  ${SCRIPTS_BINDINGS}
        COMMAND ${PERL_EXECUTABLE} ${WEBCORE_DIR}/dom/make_names.pl --outputDir ${WebCore_DERIVED_SOURCES_DIR} --enum ${_enum} --elements ${WEBCORE_DIR}/html/HTMLTagNames.in --elements ${WEBCORE_DIR}/svg/svgtags.in --elements ${WEBCORE_DIR}/mathml/mathtags.in --attrs ${WEBCORE_DIR}/html/HTMLAttributeNames.in --attrs ${WEBCORE_DIR}/mathml/mathattrs.in --attrs ${WEBCORE_DIR}/svg/svgattrs.in --attrs ${WEBCORE_DIR}/svg/xlinkattrs.in --attrs ${WEBCORE_DIR}/xml/xmlattrs.in --attrs ${WEBCORE_DIR}/xml/xmlnsattrs.in
        VERBATIM)
endfunction()
