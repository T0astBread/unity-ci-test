#! /bin/sh

# NOTE the command args below make the assumption that your Unity project folder is
#  a subdirectory of the repo root directory, e.g. for this repo "unity-ci-test" 
#  the project folder is "UnityProject". If this is not true then adjust the 
#  -projectPath argument to point to the right location.

echo "CWD: "
pwd
echo "---"
ls .

# ## Run the editor unit tests
# echo "Running editor unit tests for ${UNITYCI_PROJECT_NAME}"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
# 	-batchmode \
# 	-nographics \
# 	-silent-crashes \
# 	-logFile $(pwd)/unity.log \
# 	-projectPath "$(pwd)" \
# 	-runEditorTests \
# 	-editorTestsResultFile $(pwd)/test.xml \
# 	-quit

# rc0=$?
# echo "Unit test logs"
# cat $(pwd)/test.xml
# # exit if tests failed
# if [ $rc0 -ne 0 ]; then { echo "Failed unit tests"; exit $rc0; } fi

# ## Make the builds
# # Recall from install.sh that a separate module was needed for Windows build support
# echo "Attempting build of ${UNITYCI_PROJECT_NAME} for Windows"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
# 	-batchmode \
# 	-nographics \
# 	-silent-crashes \
# 	-logFile $(pwd)/unity.log \
# 	-projectPath "$(pwd)" \
# 	-buildWindowsPlayer "$(pwd)/Builds/Windows/${UNITYCI_PROJECT_NAME}.exe" \
# 	-quit

# rc1=$?
# echo "Build logs (Windows)"
# cat $(pwd)/unity.log

# echo "Attempting build of ${UNITYCI_PROJECT_NAME} for OSX"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
# 	-batchmode \
# 	-nographics \
# 	-silent-crashes \
# 	-logFile $(pwd)/unity.log \
# 	-projectPath "$(pwd)" \
# 	-buildOSXUniversalPlayer "$(pwd)/Builds/osx/${UNITYCI_PROJECT_NAME}.app" \
# 	-quit

# rc2=$?
# echo "Build logs (OSX)"
# cat $(pwd)/unity.log

echo "Attempting build of ${UNITYCI_PROJECT_NAME} for WebGL"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
	-batchmode \
	-nographics \
	-silent-crashes \
	-force-free \
	-username $UNITY_USERNAME \
	-password $UNITY_PASSWORD \
	-logFile $(pwd)/unity.log \
	-projectPath "$(pwd)" \
	-executeMethod "BuildWebGL.Build" \
	-quit

rc2=$?
echo "Build logs (WebGL)"
cat $(pwd)/unity.log

# exit $(($rc1|$rc2))
exit $rc2
