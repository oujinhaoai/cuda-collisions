#define L 8
#define NUM_RADICES 256
#define NUM_BLOCKS 16
#define GROUPS_PER_BLOCK 12
#define THREADS_PER_GROUP 16
#define PADDED_BLOCKS 16
#define PADDED_GROUPS 256

#ifndef UINT32_MAX
  #define UINT32_MAX 0xffffffff
#endif

unsigned int cudaCellCollide(uint32_t *cells, uint32_t *objects,
                             float *positions, float *velocities, float *dims,
                             unsigned int num_objects, unsigned int num_cells,
                             unsigned int *temp, unsigned int *test_count,
                             unsigned int num_blocks,
                             unsigned int threads_per_block);
unsigned int cudaInitCells(uint32_t *cells, uint32_t *objects,
                           float *positions, float *dims,
                           unsigned int num_objects, float cell_dim,
                           unsigned int *temp, unsigned int num_blocks,
                           unsigned int threads_per_block);
void cudaInitObjects(float *positions, float *velocities, float *dims,
                     unsigned int num_objects, float max_speed, float max_dim,
                     unsigned int num_blocks, unsigned int threads_per_block);
void cudaSortCells(uint32_t *cells, uint32_t *objects, uint32_t *cells_temp,
                   uint32_t *objects_temp, uint32_t *radices,
                   uint32_t *radix_sums, unsigned int num_objects);
void cudaPrefixSum(uint32_t *values, unsigned int n);
unsigned int cudaSumReduce(unsigned int *values, unsigned int n,
                           unsigned int *temp);
