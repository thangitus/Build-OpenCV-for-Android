#! /bin/bash

if [ ! -e "android-x86_64" ]
then
	mkdir -p "android-x86_64" || exit 1
fi
pushd "android-x86_64"
rm -rf *
cmake 	-DCMAKE_TOOLCHAIN_FILE=../../platforms/android/android.toolchain.cmake \
	-DANDROID_NATIVE_API_LEVEL=21 \
	-DANDROID_TOOLCHAIN_NAME=x86_64-4.9 \
	-DANDROID_ABI=x86_64 \
-DWITH_CUDA=OFF \
	-DANDROID_STL=gnustl_shared \
	-DWITH_PNG=OFF \
	-DBUILD_PNG=OFF \
	-DBUILD_JPEG=OFF \
	-DWITH_JPEG=OFF \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DWITH_PYTHON=OFF \
	-DWITH_JAVA=OFF \
	-DBUILD_JAVA=OFF  \
	-DBUILD_ANDROID_EXAMPLES=OFF \
	-DBUILD_TESTS=OFF \
	-DBUILD_PERF_TESTS=OFF \
	-DBUILD_TIFF=OFF \
	-DWITH_TIFF=OFF \
	-DWITH_WEBP=OFF \
	-DBUILD_WEBP=OFF \
	-DWITH_JASPER=OFF \
	-DBUILD_JASPER=OFF \
	-DWITH_OPENEXR=OFF \
	-DBUILD_OPENEXR=OFF \
	-DWITH_OPENMP=OFF \
	-DWITH_ITT=OFF \
	-DBUILD_ITT=OFF \
	-DWITH_QUIRC=OFF \
	-DBUILD_QUIRC=OFF \
	-DWITH_TBB=OFF \
	-DBUILD_TBB=OFF \
	-DWITH_CPUFEATURES=OFF \
	-DWITH_PROTOBUF=OFF \
	-DBUILD_PROTOBUF=OFF \
	-DBUILD_JAVA_FAT_LIB=OFF \
	-DBUILD_JAVA_FAT_LIB=OFF \
	-DWITH_IPP=OFF  \
	-DCMAKE_CXX_FLAGS_RELEASE=-Os -NDEBUG \
	-DBUILD_opencv_flann=OFF \
	-DCMAKE_INSTALL_PREFIX:PATH=$(pwd)/../install/x86_64 ../.. || exit 1
	
	make clean
	make -j $(nproc) || exit 1
	make install || exit 1	
popd 
