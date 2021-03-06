kernel void vecadd( global int* A, global int* B, global int* C ) {
    const int idx = get_global_id(0);
    C[idx] = A[idx] + B[idx];
}

kernel void vecmul( global int* A, global int* B, global int* C ) {
    const int idx = get_global_id(0);
    C[idx] = A[idx] * B[idx];
}

kernel void matmul(int dim, global int* A, global int* B, global int* C ) {
    const int idx = get_global_id(0);
    for (int i=0; i<dim; i++ ) {
        for (int j=0; j<dim; j++ ) {
            C[i*dim+j] = 0;
            for (int k=0; k<dim; k++ ) {
                C[i * dim + j] += A[i*dim +k] * B[k*dim + j];
            }
        }
    }
}
