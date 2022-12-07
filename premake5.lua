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
		"./lib/texture1.c",
		"./lib/texture1.h",
		"./lib/texture2.c",
		"./lib/texture2.h",
		"./lib/uthash.h",
		"./lib/vk_format.h",
		"./lib/vkformat_check.c",
		"./lib/vkformat_enum.h",
		"./lib/vkformat_str.c",
		"./include/ktxvulkan.h",
		"./lib/vk_funcs.c",
		"./lib/vk_funcs.h",
		"./lib/vkloader.c",
		"./lib/gl_funcs.c",
		"./lib/gl_funcs.h",
		"./lib/glloader.c",
		"./lib/basis_encode.cpp",
		"./lib/astc_encode.cpp",
		"./lib/writer1.c",
		"./lib/writer2.c",

		"./lib/basisu/encoder/basisu_backend.cpp",
		"./lib/basisu/encoder/basisu_backend.h",
		"./lib/basisu/encoder/basisu_basis_file.cpp",
		"./lib/basisu/encoder/basisu_basis_file.h",
		"./lib/basisu/encoder/basisu_bc7enc.cpp",
		"./lib/basisu/encoder/basisu_bc7enc.h",
		"./lib/basisu/encoder/basisu_comp.cpp",
		"./lib/basisu/encoder/basisu_comp.h",
		"./lib/basisu/encoder/basisu_enc.cpp",
		"./lib/basisu/encoder/basisu_enc.h",
		"./lib/basisu/encoder/basisu_etc.cpp",
		"./lib/basisu/encoder/basisu_etc.h",
		"./lib/basisu/encoder/basisu_frontend.cpp",
		"./lib/basisu/encoder/basisu_frontend.h",
		"./lib/basisu/encoder/basisu_gpu_texture.cpp",
		"./lib/basisu/encoder/basisu_gpu_texture.h",
		"./lib/basisu/encoder/basisu_kernels_declares.h",
		"./lib/basisu/encoder/basisu_kernels_imp.h",
		"./lib/basisu/encoder/basisu_kernels_sse.cpp",
		"./lib/basisu/encoder/basisu_miniz.h",
		"./lib/basisu/encoder/basisu_opencl.cpp",
		"./lib/basisu/encoder/basisu_opencl.h",
		"./lib/basisu/encoder/basisu_pvrtc1_4.cpp",
		"./lib/basisu/encoder/basisu_pvrtc1_4.h",
		"./lib/basisu/encoder/basisu_resample_filters.cpp",
		"./lib/basisu/encoder/basisu_resampler_filters.h",
		"./lib/basisu/encoder/basisu_resampler.cpp",
		"./lib/basisu/encoder/basisu_resampler.h",
		"./lib/basisu/encoder/basisu_ssim.cpp",
		"./lib/basisu/encoder/basisu_ssim.h",
		"./lib/basisu/encoder/basisu_uastc_enc.cpp",
		"./lib/basisu/encoder/basisu_uastc_enc.h",
		"./lib/basisu/encoder/cppspmd_flow.h",
		"./lib/basisu/encoder/cppspmd_math.h",
		"./lib/basisu/encoder/cppspmd_math_declares.h",
		"./lib/basisu/encoder/cppspmd_sse.h",
		"./lib/basisu/encoder/cppspmd_type_aliases.h",

		"./lib/astc-encoder/Source/astcenc_averages_and_directions.cpp",
        "./lib/astc-encoder/Source/astcenc_block_sizes.cpp",
        "./lib/astc-encoder/Source/astcenc_color_quantize.cpp",
        "./lib/astc-encoder/Source/astcenc_color_unquantize.cpp",
        "./lib/astc-encoder/Source/astcenc_compress_symbolic.cpp",
        "./lib/astc-encoder/Source/astcenc_compute_variance.cpp",
        "./lib/astc-encoder/Source/astcenc_decompress_symbolic.cpp",
        "./lib/astc-encoder/Source/astcenc_diagnostic_trace.cpp",
        "./lib/astc-encoder/Source/astcenc_entry.cpp",
        "./lib/astc-encoder/Source/astcenc_find_best_partitioning.cpp",
        "./lib/astc-encoder/Source/astcenc_ideal_endpoints_and_weights.cpp",
        "./lib/astc-encoder/Source/astcenc_image.cpp",
        "./lib/astc-encoder/Source/astcenc_integer_sequence.cpp",
        "./lib/astc-encoder/Source/astcenc_mathlib.cpp",
        "./lib/astc-encoder/Source/astcenc_mathlib_softfloat.cpp",
        "./lib/astc-encoder/Source/astcenc_partition_tables.cpp",
        "./lib/astc-encoder/Source/astcenc_percentile_tables.cpp",
        "./lib/astc-encoder/Source/astcenc_pick_best_endpoint_format.cpp",
        "./lib/astc-encoder/Source/astcenc_platform_isa_detection.cpp",
        "./lib/astc-encoder/Source/astcenc_quantization.cpp",
        "./lib/astc-encoder/Source/astcenc_symbolic_physical.cpp",
        "./lib/astc-encoder/Source/astcenc_weight_align.cpp",
        "./lib/astc-encoder/Source/astcenc_weight_quant_xfer_tables.cpp"
	}

	includedirs {
		"%{IncludeDir.zstd}",
		"%{IncludeDir.ktx_software}",

		"./utils",
		"./lib/dfdutils",
		"./other_include",
		"./lib/astc-encoder/Source",
	}

	defines {
		"LIBKTX=1",
		"KTX_FEATURE_KTX1",
		"KTX_FEATURE_KTX2",
		"KTX_FEATURE_WRITE",
		"BASISU_SUPPORT_SSE=1",
		"BASISD_SUPPORT_KTX2=1",
		"BASISU_SUPPORT_OPENCL=0",
		"BASISD_SUPPORT_KTX2_ZSTD=1",
	}

	filter "options:sse"
		defines { "__SSE__" }
	filter "options:sse2"
		defines { "__SSE2__" }
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
	filter { "options:popcnt" }
		defines { "__POPCNT__" }

 	filter "action:vs*"
		disablewarnings { "4244", "4996", "4005", "4267" }