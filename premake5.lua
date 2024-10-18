project "Box2D"
	architecture "x64"

	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	cdialect "C17"
	staticruntime "On"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-intermediates/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/box2d/**.h",
		"include/box2d/**.cpp",
		"src/**.cpp",
		"src/**.h",
		"src/**.c",
		"premake5.lua"
	}

	includedirs
	{
		"include",
		"src",
	}

	buildoptions
	{
		"/experimental:c11atomics"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
