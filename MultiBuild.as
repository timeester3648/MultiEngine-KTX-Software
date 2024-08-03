void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("KTX-Software");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE.md");

	properties.project_includes("zstd");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./include"
	});

	properties.files({
		// Note: taken from CMakeLists.txt
		"./include/KHR/khr_df.h",
		"./include/ktx.h",
		"./lib/basis_sgd.h",
		"./lib/basis_transcode.cpp",
		"./lib/miniz_wrapper.cpp",
		"./external/basisu/transcoder/basisu_containers.h",
		"./external/basisu/transcoder/basisu_containers_impl.h",
		"./external/basisu/transcoder/basisu_file_headers.h",
		"./external/basisu/transcoder/basisu_transcoder_internal.h",
		"./external/basisu/transcoder/basisu_transcoder_uastc.h",
		"./external/basisu/transcoder/basisu_transcoder.cpp",
		"./external/basisu/transcoder/basisu_transcoder.h",
		"./external/basisu/transcoder/basisu.h",
		"./external/basisu/zstd/zstd.c",
		"./lib/checkheader.c",
		"./external/dfdutils/createdfd.c",
		"./external/dfdutils/colourspaces.c",
		"./external/dfdutils/dfd.h",
		"./external/dfdutils/interpretdfd.c",
		"./external/dfdutils/printdfd.c",
		"./external/dfdutils/queries.c",
		"./external/dfdutils/vk2dfd.c",
		"./external/dfdutils/vk2dfd.inl",
		"./external/dfdutils/vulkan/vk_platform.h",
		"./external/dfdutils/vulkan/vulkan_core.h",
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
		"./lib/texture_funcs.inl",
		"./lib/uthash.h",
		"./lib/vk2gl.h",
		"./lib/vk_format.h",
		"./lib/vkFormat2glFormat.inl",
		"./lib/vkFormat2glInternalFormat.inl",
		"./lib/vkFormat2glType.inl",
		"./lib/vkformat_check.c",
		"./lib/vkformat_enum.h",
		"./lib/vkformat_str.c",
		"./lib/vkformat_typesize.c",

		"./external/basisu/encoder/basisu_backend.cpp",
		"./external/basisu/encoder/basisu_backend.h",
		"./external/basisu/encoder/basisu_basis_file.cpp",
		"./external/basisu/encoder/basisu_basis_file.h",
		"./external/basisu/encoder/basisu_bc7enc.cpp",
		"./external/basisu/encoder/basisu_bc7enc.h",
		"./external/basisu/encoder/basisu_comp.cpp",
		"./external/basisu/encoder/basisu_comp.h",
		"./external/basisu/encoder/basisu_enc.cpp",
		"./external/basisu/encoder/basisu_enc.h",
		"./external/basisu/encoder/basisu_etc.cpp",
		"./external/basisu/encoder/basisu_etc.h",
		"./external/basisu/encoder/basisu_frontend.cpp",
		"./external/basisu/encoder/basisu_frontend.h",
		"./external/basisu/encoder/basisu_gpu_texture.cpp",
		"./external/basisu/encoder/basisu_gpu_texture.h",
		"./external/basisu/encoder/basisu_kernels_declares.h",
		"./external/basisu/encoder/basisu_kernels_imp.h",
		"./external/basisu/encoder/basisu_kernels_sse.cpp",
		"./external/basisu/encoder/basisu_miniz.h",
		"./external/basisu/encoder/basisu_opencl.cpp",
		"./external/basisu/encoder/basisu_opencl.h",
		"./external/basisu/encoder/basisu_pvrtc1_4.cpp",
		"./external/basisu/encoder/basisu_pvrtc1_4.h",
		"./external/basisu/encoder/basisu_resample_filters.cpp",
		"./external/basisu/encoder/basisu_resampler_filters.h",
		"./external/basisu/encoder/basisu_resampler.cpp",
		"./external/basisu/encoder/basisu_resampler.h",
		"./external/basisu/encoder/basisu_ssim.cpp",
		"./external/basisu/encoder/basisu_ssim.h",
		"./external/basisu/encoder/basisu_uastc_enc.cpp",
		"./external/basisu/encoder/basisu_uastc_enc.h",
		"./external/basisu/encoder/cppspmd_flow.h",
		"./external/basisu/encoder/cppspmd_math.h",
		"./external/basisu/encoder/cppspmd_math_declares.h",
		"./external/basisu/encoder/cppspmd_sse.h",
		"./external/basisu/encoder/cppspmd_type_aliases.h",

		"./utils/argparser.cpp",
		"./utils/argparser.h",
		"./utils/ktxapp.h",
		"./utils/sbufstream.h",
		"./utils/scapp.h",
		"./utils/stdafx.h",
		"./utils/platform_utils.h",
		"./utils/unused.h",

		"./lib/basis_encode.cpp",
		"./lib/astc_encode.cpp",
		"./lib/writer1.c",
		"./lib/writer2.c",

		"./lib/texture1.c",
		"./lib/texture1.h",

		"./external/astc-encoder/Source/*.cpp"
	});

	properties.excluded_files("./external/astc-encoder/Source/astcenccli*");

	properties.include_directories({
		"./utils",
		"./other_include",
		"./external"
	});

	properties.defines({
		"LIBKTX=1",
		"KTX_FEATURE_KTX1",
		"KTX_FEATURE_KTX2",
		"KTX_FEATURE_WRITE",
		"BASISU_SUPPORT_SSE=1",
		"BASISD_SUPPORT_KTX2=1",
		"BASISU_SUPPORT_OPENCL=0",
		"BASISD_SUPPORT_KTX2_ZSTD=1"
	});

	{
		MultiBuild::ScopedFilter _(project, "project.compiler:VisualCpp");
		properties.disable_warnings({ "4244", "4996", "4005", "4267" });
	}
}