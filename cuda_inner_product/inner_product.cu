#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>
// Kernel that executes on the CUDA device
__global__ void vector_mul(float *x, float *y, float *z, int N) 
{												
	int idx = blockIdx.x * blockDim.x + threadIdx.x; 
	if (idx < N) z[idx] = x[idx] * y[idx];  
}
// main routine that executes on the host
int main(void)
{
	float *x_h, *x_d, *y_h, *y_d, *z_h, *z_d; // Pointer to host & device arrays
	int i;
	float result=0;
	int N = 20; // Number of elements in arrays
	printf("Enter number of vector sizes N: ");
	scanf("%d", &N);

	size_t size = N * sizeof(float);
	x_h = (float *)malloc(size); // Allocate vectors on host
	y_h = (float *)malloc(size);
	z_h = (float *)malloc(size);

	cudaMalloc((void **)&x_d, size); // Allocate vectors on device
	cudaMalloc((void **)&y_d, size); 
	cudaMalloc((void **)&z_d, size);

	// Initialize host vectors and copy them to CUDA device
	printf("\nEnter members of vector X:\n");
	for (i = 0; i < N; i++)	
		scanf("%f", &x_h[i]);
	
	printf("\nEnter members of vector Y:\n");
	for (i = 0; i < N; i++)	
		scanf("%f", &y_h[i]);

	for (int i = 0; i < N; i++) 
		z_h[i] = 0;
	
	cudaMemcpy(x_d, x_h, size, cudaMemcpyHostToDevice);
	cudaMemcpy(y_d, y_h, size, cudaMemcpyHostToDevice);
	cudaMemcpy(z_d, z_h, size, cudaMemcpyHostToDevice);
	
	// Do calculation on device:
	int block_size = 4;
	int n_blocks = N / block_size + (N%block_size == 0 ? 0 : 1);
	vector_mul <<< n_blocks, block_size >>> (x_d, y_d, z_d, N); // cuda syntax <<< >>>
	// Retrieve result from device and store it in host array
	cudaMemcpy(x_h, x_d, sizeof(float)*N, cudaMemcpyDeviceToHost); // GPU memory must be copied to CPU memory
	cudaMemcpy(y_h, y_d, sizeof(float)*N, cudaMemcpyDeviceToHost);
	cudaMemcpy(z_h, z_d, sizeof(float)*N, cudaMemcpyDeviceToHost);
	
	for (i = 0; i < N; i++) 
		result = result + z_h[i];

	// Print result
	printf("%f", result); 
	// Cleanup
	free(x_h); free(y_h); free(z_h);
	cudaFree(x_d); cudaFree(y_d); cudaFree(z_d);
	system("PAUSE");
}