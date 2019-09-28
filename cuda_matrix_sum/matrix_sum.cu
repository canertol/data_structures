#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>
// Kernel that executes on the CUDA device
__global__ void matrix_add(float *x, float *y, float *z, int N) 
{												
	int ix = blockIdx.x*blockDim.x + threadIdx.x;
	int iy = blockIdx.y*blockDim.y + threadIdx.y;
	int idx = iy * N + ix;
	z[idx] = x[idx] + y[idx];
}

int main(void)
{
		int m, n;
		printf("Type the number of Rows and Columns\n");
		scanf("%d %d", &m, &n);

		float *h_a, *h_b, *h_c;
		float *d_a, *d_b, *d_c;
		cudaMallocHost((void **)&h_a, sizeof(float)*m*n);
		cudaMallocHost((void **)&h_b, sizeof(float)*m*n);
		cudaMallocHost((void **)&h_c, sizeof(float)*m*n);

		//  matrix A
		printf("Type %d elements of Matrix X\n",m*n);

		for (int i = 0; i < m; ++i) {
			for (int j = 0; j < n; ++j) {
				scanf("%f", &h_a[i * n + j]);
			}
		}
		
		//  matrix B
		printf("Type %d elements of Matrix Y\n", m*n);

		for (int i = 0; i < m; ++i) {
			for (int j = 0; j < n; ++j) {
				scanf("%f", &h_b[i * n + j]);
			}
		}
		
	cudaMalloc((void **)&d_a, sizeof(float)*m*n);
	cudaMalloc((void **)&d_b, sizeof(float)*m*n);
	cudaMalloc((void **)&d_c, sizeof(float)*m*n);


	cudaMemcpy(d_a, h_a, sizeof(float)*m*n, cudaMemcpyHostToDevice);
	cudaMemcpy(d_b, h_b, sizeof(float)*m*n, cudaMemcpyHostToDevice);
	
	// Do calculation on device:
	int block_size = 4;
	int n_blocks = (m*n) / block_size + ((m*n)%block_size == 0 ? 0 : 1);

	matrix_add <<< n_blocks, block_size >>> (d_a, d_b, d_c, n); // cuda syntax <<< >>>
	// Retrieve result from device and store it in host array
	cudaMemcpy(h_c, d_c, sizeof(int)*m*n, cudaMemcpyDeviceToHost);

	printf("Resulting matrix Z is X + Y=\n");
	for (int i = 0; i < m; ++i) {
		for (int j = 0; j < n; ++j) {
			printf("%f ", h_c[i * n + j]);
		}
		printf("\n");
	}

	// Cleanup
	cudaFree(d_a);
	cudaFree(d_b);
	cudaFree(d_c);
	cudaFreeHost(h_a);
	cudaFreeHost(h_b);
	cudaFreeHost(h_c);
	system("PAUSE");
}