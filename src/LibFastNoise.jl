module LibFastNoise

using FastNoise2_jll
export FastNoise2_jll

using CEnum

function fnNewFromEncodedNodeTree(encodedString, simdLevel)
    ccall((:fnNewFromEncodedNodeTree, libFastNoise), Ptr{Cvoid}, (Ptr{Cchar}, Cuint), encodedString, simdLevel)
end

function fnDeleteNodeRef(node)
    ccall((:fnDeleteNodeRef, libFastNoise), Cvoid, (Ptr{Cvoid},), node)
end

function fnGetSIMDLevel(node)
    ccall((:fnGetSIMDLevel, libFastNoise), Cuint, (Ptr{Cvoid},), node)
end

function fnGetMetadataID(node)
    ccall((:fnGetMetadataID, libFastNoise), Cint, (Ptr{Cvoid},), node)
end

function fnGenUniformGrid2D(node, noiseOut, xStart, yStart, xSize, ySize, frequency, seed, outputMinMax)
    ccall((:fnGenUniformGrid2D, libFastNoise), Cvoid, (Ptr{Cvoid}, Ptr{Cfloat}, Cint, Cint, Cint, Cint, Cfloat, Cint, Ptr{Cfloat}), node, noiseOut, xStart, yStart, xSize, ySize, frequency, seed, outputMinMax)
end

function fnGenUniformGrid3D(node, noiseOut, xStart, yStart, zStart, xSize, ySize, zSize, frequency, seed, outputMinMax)
    ccall((:fnGenUniformGrid3D, libFastNoise), Cvoid, (Ptr{Cvoid}, Ptr{Cfloat}, Cint, Cint, Cint, Cint, Cint, Cint, Cfloat, Cint, Ptr{Cfloat}), node, noiseOut, xStart, yStart, zStart, xSize, ySize, zSize, frequency, seed, outputMinMax)
end

function fnGenUniformGrid4D(node, noiseOut, xStart, yStart, zStart, wStart, xSize, ySize, zSize, wSize, frequency, seed, outputMinMax)
    ccall((:fnGenUniformGrid4D, libFastNoise), Cvoid, (Ptr{Cvoid}, Ptr{Cfloat}, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cfloat, Cint, Ptr{Cfloat}), node, noiseOut, xStart, yStart, zStart, wStart, xSize, ySize, zSize, wSize, frequency, seed, outputMinMax)
end

function fnGenPositionArray2D(node, noiseOut, count, xPosArray, yPosArray, xOffset, yOffset, seed, outputMinMax)
    ccall((:fnGenPositionArray2D, libFastNoise), Cvoid, (Ptr{Cvoid}, Ptr{Cfloat}, Cint, Ptr{Cfloat}, Ptr{Cfloat}, Cfloat, Cfloat, Cint, Ptr{Cfloat}), node, noiseOut, count, xPosArray, yPosArray, xOffset, yOffset, seed, outputMinMax)
end

function fnGenPositionArray3D(node, noiseOut, count, xPosArray, yPosArray, zPosArray, xOffset, yOffset, zOffset, seed, outputMinMax)
    ccall((:fnGenPositionArray3D, libFastNoise), Cvoid, (Ptr{Cvoid}, Ptr{Cfloat}, Cint, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cfloat, Cfloat, Cfloat, Cint, Ptr{Cfloat}), node, noiseOut, count, xPosArray, yPosArray, zPosArray, xOffset, yOffset, zOffset, seed, outputMinMax)
end

function fnGenPositionArray4D(node, noiseOut, count, xPosArray, yPosArray, zPosArray, wPosArray, xOffset, yOffset, zOffset, wOffset, seed, outputMinMax)
    ccall((:fnGenPositionArray4D, libFastNoise), Cvoid, (Ptr{Cvoid}, Ptr{Cfloat}, Cint, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Ptr{Cfloat}), node, noiseOut, count, xPosArray, yPosArray, zPosArray, wPosArray, xOffset, yOffset, zOffset, wOffset, seed, outputMinMax)
end

function fnGenTileable2D(node, noiseOut, xSize, ySize, frequency, seed, outputMinMax)
    ccall((:fnGenTileable2D, libFastNoise), Cvoid, (Ptr{Cvoid}, Ptr{Cfloat}, Cint, Cint, Cfloat, Cint, Ptr{Cfloat}), node, noiseOut, xSize, ySize, frequency, seed, outputMinMax)
end

function fnGenSingle2D(node, x, y, seed)
    ccall((:fnGenSingle2D, libFastNoise), Cfloat, (Ptr{Cvoid}, Cfloat, Cfloat, Cint), node, x, y, seed)
end

function fnGenSingle3D(node, x, y, z, seed)
    ccall((:fnGenSingle3D, libFastNoise), Cfloat, (Ptr{Cvoid}, Cfloat, Cfloat, Cfloat, Cint), node, x, y, z, seed)
end

function fnGenSingle4D(node, x, y, z, w, seed)
    ccall((:fnGenSingle4D, libFastNoise), Cfloat, (Ptr{Cvoid}, Cfloat, Cfloat, Cfloat, Cfloat, Cint), node, x, y, z, w, seed)
end

# no prototype is found for this function at FastNoise_C.h:55:19, please use with caution
function fnGetMetadataCount()
    ccall((:fnGetMetadataCount, libFastNoise), Cint, ())
end

function fnGetMetadataName(id)
    ccall((:fnGetMetadataName, libFastNoise), Ptr{Cchar}, (Cint,), id)
end

function fnNewFromMetadata(id, simdLevel)
    ccall((:fnNewFromMetadata, libFastNoise), Ptr{Cvoid}, (Cint, Cuint), id, simdLevel)
end

function fnGetMetadataVariableCount(id)
    ccall((:fnGetMetadataVariableCount, libFastNoise), Cint, (Cint,), id)
end

function fnGetMetadataVariableName(id, variableIndex)
    ccall((:fnGetMetadataVariableName, libFastNoise), Ptr{Cchar}, (Cint, Cint), id, variableIndex)
end

function fnGetMetadataVariableType(id, variableIndex)
    ccall((:fnGetMetadataVariableType, libFastNoise), Cint, (Cint, Cint), id, variableIndex)
end

function fnGetMetadataVariableDimensionIdx(id, variableIndex)
    ccall((:fnGetMetadataVariableDimensionIdx, libFastNoise), Cint, (Cint, Cint), id, variableIndex)
end

function fnGetMetadataEnumCount(id, variableIndex)
    ccall((:fnGetMetadataEnumCount, libFastNoise), Cint, (Cint, Cint), id, variableIndex)
end

function fnGetMetadataEnumName(id, variableIndex, enumIndex)
    ccall((:fnGetMetadataEnumName, libFastNoise), Ptr{Cchar}, (Cint, Cint, Cint), id, variableIndex, enumIndex)
end

function fnSetVariableFloat(node, variableIndex, value)
    ccall((:fnSetVariableFloat, libFastNoise), Cint, (Ptr{Cvoid}, Cint, Cfloat), node, variableIndex, value)
end

function fnSetVariableIntEnum(node, variableIndex, value)
    ccall((:fnSetVariableIntEnum, libFastNoise), Cint, (Ptr{Cvoid}, Cint, Cint), node, variableIndex, value)
end

function fnGetMetadataNodeLookupCount(id)
    ccall((:fnGetMetadataNodeLookupCount, libFastNoise), Cint, (Cint,), id)
end

function fnGetMetadataNodeLookupName(id, nodeLookupIndex)
    ccall((:fnGetMetadataNodeLookupName, libFastNoise), Ptr{Cchar}, (Cint, Cint), id, nodeLookupIndex)
end

function fnGetMetadataNodeLookupDimensionIdx(id, nodeLookupIndex)
    ccall((:fnGetMetadataNodeLookupDimensionIdx, libFastNoise), Cint, (Cint, Cint), id, nodeLookupIndex)
end

function fnSetNodeLookup(node, nodeLookupIndex, nodeLookup)
    ccall((:fnSetNodeLookup, libFastNoise), Cint, (Ptr{Cvoid}, Cint, Ptr{Cvoid}), node, nodeLookupIndex, nodeLookup)
end

function fnGetMetadataHybridCount(id)
    ccall((:fnGetMetadataHybridCount, libFastNoise), Cint, (Cint,), id)
end

function fnGetMetadataHybridName(id, hybridIndex)
    ccall((:fnGetMetadataHybridName, libFastNoise), Ptr{Cchar}, (Cint, Cint), id, hybridIndex)
end

function fnGetMetadataHybridDimensionIdx(id, hybridIndex)
    ccall((:fnGetMetadataHybridDimensionIdx, libFastNoise), Cint, (Cint, Cint), id, hybridIndex)
end

function fnSetHybridNodeLookup(node, hybridIndex, nodeLookup)
    ccall((:fnSetHybridNodeLookup, libFastNoise), Cint, (Ptr{Cvoid}, Cint, Ptr{Cvoid}), node, hybridIndex, nodeLookup)
end

function fnSetHybridFloat(node, hybridIndex, value)
    ccall((:fnSetHybridFloat, libFastNoise), Cint, (Ptr{Cvoid}, Cint, Cfloat), node, hybridIndex, value)
end

# exports
const PREFIXES = ["fn"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
