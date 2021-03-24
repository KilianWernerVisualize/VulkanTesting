for %%i in (*.vert) do (
   C:\VulkanSDK\1.2.162.1\Bin32\glslc.exe %%i -o %%~ni.spv
)

for %%i in (*.frag) do (
   C:\VulkanSDK\1.2.162.1\Bin32\glslc.exe %%i -o %%~ni.spv
)
pause