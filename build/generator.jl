using Clang.Generators
using FastNoise2_jll

cd(@__DIR__)

include_dir = normpath(FastNoise2_jll.artifact_dir, "include")
fastnoise_dir = joinpath(include_dir, "FastNoise")

options = load_options(joinpath(@__DIR__, "generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()  # Note you must call this function firstly and then append your own flags
push!(args, "-I$include_dir")

headers = [joinpath(fastnoise_dir, "FastNoise_C.h")]

# create context
ctx = create_context(headers, args, options)

# run generator
build!(ctx)