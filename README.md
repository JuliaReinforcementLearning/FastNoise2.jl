# FastNoise2.jl

A Julia wrapper for [Auburn/FastNoise2](https://github.com/Auburn/FastNoise2) through the C API.


## Interactive Example

[![demo.gif](https://user-images.githubusercontent.com/5612003/183391912-64017721-227b-4448-948d-0022ec2e76d9.gif)](./notebooks/notebook.jl)

## Usage

```julia
julia> using FastNoise2

julia> n = Node("OpenSimplex2")  # Create a node. List all the supported names with `keys(FastNoise2.NODE_NAMES_TO_ID)`
Node(Ptr{Nothing} @0x0000000002fa72b0, 1946463812)

julia> n(4, 3)  # Generate one single noise value at specific 2D position
-0.4346525f0

julia> n(0.4,0.3,0.2)  # 3D
0.5271185f0

julia> n(0.4,0.3,0.2,0.1)  # 4D
0.5271185f0

julia> n((4,4), 4, 3) # Generate a 2D Matrix
4×4 Matrix{Float32}:
 -0.434653  0.34371   -0.616628   -0.600485
 -0.251613  0.84233    0.700396   -0.0943251
 -0.604788  0.202821   0.0345254   0.968949
 -0.554117  0.12885    0.70932     0.848869

julia> n((2,3,4), 4, 3, 2; frequency=0.1)  # Generate a 3D Array. 4D is also similar. Note the frequency parameter
2×3×4 Array{Float32, 3}:
[:, :, 1] =
 0.527119  0.488778  0.278744
 0.569762  0.488646  0.235996

[:, :, 2] =
 0.796065  0.644488  0.299173
 0.791319  0.598346  0.215275

[:, :, 3] =
 0.926368  0.690241  0.246656
 0.894577  0.616639  0.132056

[:, :, 4] =
 0.894904  0.616644  0.132056
 0.846379  0.528225  0.0

ulia> x = zeros(Float32, 4, 4)
4×4 Matrix{Float32}:
 0.0  0.0  0.0  0.0
 0.0  0.0  0.0  0.0
 0.0  0.0  0.0  0.0
 0.0  0.0  0.0  0.0

julia> n(x, 4,3)  # the in-place version

julia> x
4×4 Matrix{Float32}:
 -0.434653  0.34371   -0.616628   -0.600485
 -0.251613  0.84233    0.700396   -0.0943251
 -0.604788  0.202821   0.0345254   0.968949
 -0.554117  0.12885    0.70932     0.848869
```
