void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("KTX-Software");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE.md");

	properties.project_includes("zstd");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./lib/include"
	});

	properties.files({
		// Note: taken from CMakeLists.txt
		"./lib/include/KHR/khr_df.h",
		"./lib/include/ktx.h",
		"./lib/src/basis_sgd.h",
		"./lib/src/basis_transcode.cpp",
		"./lib/src/miniz_wrapper.cpp",
		"./external/basis_universal/transcoder/basisu_containers.h",
		"./external/basis_universal/transcoder/basisu_containers_impl.h",
		"./external/basis_universal/transcoder/basisu_file_headers.h",
		"./external/basis_universal/transcoder/basisu_transcoder_internal.h",
		"./external/basis_universal/transcoder/basisu_transcoder_uastc.h",
		"./external/basis_universal/transcoder/basisu_transcoder.cpp",
		"./external/basis_universal/transcoder/basisu_transcoder.h",
		"./external/basis_universal/transcoder/basisu.h",
		"./external/basis_universal/zstd/zstd.c",
		"./lib/src/checkheader.c",
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
		"./lib/src/etcunpack.cxx",
		"./lib/src/filestream.c",
		"./lib/src/filestream.h",
		"./lib/src/formatsize.h",
		"./lib/src/gl_format.h",
		"./lib/src/hashlist.c",
		"./lib/src/info.c",
		"./lib/src/ktxint.h",
		"./lib/src/memstream.c",
		"./lib/src/memstream.h",
		"./lib/src/strings.c",
		"./lib/src/swap.c",
		"./lib/src/texture.c",
		"./lib/src/texture.h",
		"./lib/src/texture2.c",
		"./lib/src/texture2.h",
		"./lib/src/texture_funcs.inl",
		"./lib/src/uthash.h",
		"./lib/src/vk2gl.h",
		"./lib/src/vk_format.h",
		"./lib/src/vkFormat2glFormat.inl",
		"./lib/src/vkFormat2glInternalFormat.inl",
		"./lib/src/vkFormat2glType.inl",
		"./lib/src/vkformat_check.c",
		"./lib/src/vkformat_enum.h",
		"./lib/src/vkformat_str.c",
		"./lib/src/vkformat_typesize.c",
		"./lib/src/vkformat_check_variant.c",

		"./external/basis_universal/encoder/*.cpp",
		"./external/basis_universal/encoder/3rdparty/android_astc_decomp.cpp",

		"./utils/argparser.cpp",
		"./utils/argparser.h",
		"./utils/ktxapp.h",
		"./utils/sbufstream.h",
		"./utils/scapp.h",
		"./utils/stdafx.h",
		"./utils/platform_utils.h",
		"./utils/unused.h",

		"./lib/src/basis_encode.cpp",
		"./lib/src/astc_codec.cpp",
		"./lib/src/writer1.c",
		"./lib/src/writer2.c",

		"./lib/src/texture1.c",
		"./lib/src/texture1.h",

		"./external/astc-encoder/Source/*.cpp"
	});

	properties.excluded_files("./external/astc-encoder/Source/astcenccli*");

	properties.include_directories({
		"./utils",
		"./other_include",
		"./lib",
		"./external",
		"./external/basis_universal"
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
		properties.disable_warnings({ "4244", "4996", "4005", "4267", "5287" });
	}
}