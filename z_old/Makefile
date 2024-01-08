.SILENT:

all: build-env build-base build-cuda build-ml clean
	echo "LOG --> DONE..."

build-env:
	# Create docker build environment
	echo "### LOG --> INIT build environment..."
	docker buildx create --name ubuntu_envs --use
	echo "### LOG --> Created build environment..."

build-base:
	# Base
	echo "### LOG --> BUILDING BASE IMAGE..."
	docker buildx build -f ./base/Dockerfile --no-cache \
					--platform=linux/amd64,linux/arm64 --push base \
					--tag s7117/ubuntu-base:latest
	echo "### LOG --> Base image built..."

build-coral:
	echo "### LOG --> BUILDING CORALTPU IMAGE..."
	docker buildx build -f ./coraltpu/Dockerfile --no-cache \
					--platform=linux/amd64,linux/arm64 --push coraltpu \
					--tag s7117/ubuntu-coraltpu:latest
	echo "### LOG --> CoralTPU image built..."

build-cuda:
	# CUDA
	echo "### LOG --> BUILDING CUDA IMAGES..."
	docker buildx build -f ./cuda/11.7/Dockerfile --no-cache \
					--platform=linux/amd64 --push cuda \
					--tag s7117/ubuntu-cuda:11.7
	docker buildx build -f ./cuda/11.8/Dockerfile --no-cache \
					--platform=linux/amd64 --push cuda \
					--tag s7117/ubuntu-cuda:11.8
	docker buildx build -f ./cuda/12.2/Dockerfile --no-cache \
					--platform=linux/amd64 --push cuda \
					--tag s7117/ubuntu-cuda:12.2
	echo "### LOG --> CUDA images built..."
	echo "### LOG --> Pushing images..."
	docker push s7117/ubuntu-cuda:11.7
	docker push s7117/ubuntu-cuda:11.8
	docker push s7117/ubuntu-cuda:12.2


build-ml:
	# ML
	echo "### LOG --> BUILDING ML IMAGES..."
	docker buildx build -f ./ml/11.7/Dockerfile --no-cache \
					--platform=linux/amd64 --push ml \
					--tag s7117/ubuntu-ml:11.7
	docker buildx build -f ./ml/11.8/Dockerfile --no-cache \
					--platform=linux/amd64 --push ml \
					--tag s7117/ubuntu-ml:11.8
	docker buildx build -f ./ml/12.2/Dockerfile --no-cache \
					--platform=linux/amd64 --push ml \
					--tag s7117/ubuntu-ml:12.2
	echo "### LOG --> ML images built..."
	echo "### LOG --> Pushing images..."
	docker push s7117/ubuntu-ml:11.7
	docker push s7117/ubuntu-ml:11.8
	docker push s7117/ubuntu-ml:12.2

build-gpu-images:
	./scripts/build-gpus.sh

build-mc:
	# Minecraft
	echo "LOG --> NOT IMPLEMENTED..."

build-ov:
	# FIXME: OpenVINO
	# docker buildx build --no-cache \
					# --platform=linux/amd64,linux/arm64 --push openvino
	  			# --tag s7117/ubuntu_openvino:latest
	echo "LOG --> FIXME: NOT IMPLEMENTED..."

clean:
	# Cleanup build environment
	echo "LOG --> Cleaning up build env..."
	docker buildx rm ubuntu_envs
