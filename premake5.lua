include "../../premake/common_premake_defines.lua"

project "KTX-Software"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		-- taken from CMakeLists.txt
		"./include/ktx.h",
		"./lib/basis_sgd.h",
		"./lib/basis_transcode.cpp",
		"./lib/basisu/transcoder/basisu_containers.h",
		"./lib/basisu/transcoder/basisu_containers_impl.h",
		"./lib/basisu/transcoder/basisu_file_headers.h",
		"./lib/basisu/transcoder/basisu_transcoder_internal.h",
		"./lib/basisu/transcoder/basisu_transcoder_uastc.h",
		"./lib/basisu/transcoder/basisu_transcoder.cpp",
		"./lib/basisu/transcoder/basisu_transcoder.h",
		"./lib/basisu/transcoder/basisu.h",
		"./lib/basisu/zstd/zstd.c",
		"./lib/checkheader.c",
		"./lib/dfdutils/createdfd.c",
		"./lib/dfdutils/colourspaces.c",
		"./lib/dfdutils/dfd.h",
		"./lib/dfdutils/interpretdfd.c",
		"./lib/dfdutils/printdfd.c",
		"./lib/dfdutils/queries.c",
		"./lib/dfdutils/vk2dfd.c",
		"./lib/dfdutils/vk2dfd.inl",
		"./lib/dfdutils/vulkan/vk_platform.h",
		"./lib/dfdutils/vulkan/vulkan_core.h",
		"./lib/etcdec.cxx",
		"./lib/etcunpack.cxx",
		"./lib/filestream.c",
		"./lib/filestream.h",
		"./lib/formatsize.h",
		"./lib/gl_format.h",
		"./lib/hashlist.c",
		"./lib/info.c",
		"./lib/ktxint.h",
		"./lib/memstream.c",
		"./lib/memstream.h",
		"./lib/strings.c",
		"./lib/swap.c",
		"./lib/texture.c",
		"./lib/texture.h",
		"./lib/texture2.c",
		"./lib/texture2.h",
		"./lib/uthash.h",
		"./lib/vk_format.h",
		"./lib/vkformat_check.c",
		"./lib/vkformat_enum.h",
		"./lib/vkformat_str.c"
	}

	defines {
		"KHRONOS_STATIC"
	}

	includedirs {
		"%{IncludeDir.zstd}",
		"%{IncludeDir.ktx_software}",

		"./utils",
		"./lib/dfdutils",
		"./other_include",
		"./lib/astc-encoder/Source",
	}

	filter "options:sse"
		defines { "__SSE__" }
	filter "options:sse2"
		defines { "__SSE2__", "__POPCNT__" }
	filter "options:sse3"
		defines { "__SSE3__" }
	filter "options:ssse3"
		defines { "__SSSE3__" }
	filter "options:sse4.1"
		defines { "__SSE4_1__" }
	filter "options:sse4.2"
		defines { "__SSE4_2__" }
	filter "options:avx"
		defines { "__AVX__" }
	filter "options:avx2"
		defines { "__AVX2__" }
	
 	filter "system:windows"
		disablewarnings { "4244", "4996", "4005", "4267" }

 	filter "configurations:Debug"
		defines { "MLE_DEBUG_BUILD", "DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines { "MLE_RELEASE_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"

	filter "configurations:Distribution"
		defines {  "MLE_DISTRIBUTION_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"