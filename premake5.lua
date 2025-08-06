project "ImGui"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imgui_rectpack.h",
		"imgui_textedit.h",
		"imgui_truetype.h",
		"imgui_demo.cpp"
	}
	
	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "On"


		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

		postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox/")
        }


	filter {"system:windows", "configurations:Release"}
			buildoptions "/MT"