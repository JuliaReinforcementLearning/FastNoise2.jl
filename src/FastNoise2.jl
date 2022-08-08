module FastNoise2

export Node

include("LibFastNoise.jl")

using Random
using .LibFastNoise

mutable struct Node
    node::Ptr{Nothing}
    seed::Cint
    function Node(node, seed)
        n = new(node, seed)
        finalizer(n) do x
            fnDeleteNodeRef(x.node)
        end
        n
    end
end

const NODE_NAMES_TO_ID = Dict(unsafe_string(fnGetMetadataName(i)) => i for i in 0:fnGetMetadataCount()-1)

Node(name::String; seed=first(Random.make_seed()) % Cint) = Node(
    fnNewFromMetadata(NODE_NAMES_TO_ID[name], 0),
    seed
)

(n::Node)(x, y) = fnGenSingle2D(n.node, x, y, n.seed)
(n::Node)(x, y, z) = fnGenSingle3D(n.node, x, y, z, n.seed)
(n::Node)(x, y, z, w) = fnGenSingle4D(n.node, x, y, z, w, n.seed)

(n::Node)(dest::Matrix{Cfloat}, x, y; frequency=1.0f0, min_max=Cfloat[]) = fnGenUniformGrid2D(n.node, dest, x, y, size(dest)..., frequency, n.seed, min_max)
(n::Node)(dest::Array{Cfloat,3}, x, y, z; frequency=1.0f0, min_max=Cfloat[]) = fnGenUniformGrid3D(n.node, dest, x, y, z, size(dest)..., frequency, n.seed, min_max)
(n::Node)(dest::Array{Cfloat,4}, x, y, z, w; frequency=1.0f0, min_max=Cfloat[]) = fnGenUniformGrid4D(n.node, dest, x, y, z, w, size(dest)..., frequency, n.seed, min_max)

function (n::Node)(sz::NTuple, start_pos...; frequency=1.0f0, with_stats=false)
    dest = Array{Cfloat}(undef, sz)
    min_max = with_stats ? Vector{Cfloat}(undef, 2) : Cfloat[]
    n(dest, start_pos...; frequency=frequency, min_max=min_max)
    if with_stats
        dest, min_max
    else
        dest
    end
end

end # module
