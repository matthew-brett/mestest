# Init scipy build.
$ucrt_tools = "C:\rtools40"
# Or:
# $ucrt_tools = "C:\msys64-ucrt"
# Compilers, and make tools.
$env:PATH = "$ucrt_tools\ucrt64\bin;$ucrt_tools\usr\bin;$env:PATH"
# Python user path (for meson, ninja)
$env:PATH = "$env:PATH;$env:APPDATA\Python\Python39\Scripts"
