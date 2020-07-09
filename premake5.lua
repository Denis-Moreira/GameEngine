workspace "GameEngine"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

project "GameEngine"
	location "GameEngine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/%{cfg.buildcfg}/%{prj.name}")
	objdir ("bin-int/%{cfg.buildcfg}/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "c++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"GE_PLATFORM_WINDOWS",
			"GE_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/%{cfg.buildcfg}/SandBox")
		}

	filter "configurations:Debug"
		defines "GE_DEBUG"
		optimize "On"

	filter "configurations:Release"
		defines "GE_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "GE_DIST"
		optimize "On"

project "SandBox"
	location "SandBox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/%{cfg.buildcfg}/%{prj.name}")
	objdir ("bin-int/%{cfg.buildcfg}/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"GameEngine/vendor/spdlog/include",
		"GameEngine/src"
	}

	links
	{
		"GameEngine"
	}

	filter "system:windows"
		cppdialect "c++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"GE_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "GE_DEBUG"
		optimize "On"

	filter "configurations:Release"
		defines "GE_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "GE_DIST"
		optimize "On"