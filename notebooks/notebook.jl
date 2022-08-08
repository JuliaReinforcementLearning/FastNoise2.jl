### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 856b2884-16f8-11ed-3fab-6122cef82810
using Pkg

# ╔═╡ 5ad3425d-42fc-414a-a6a2-7138569686f8
# ╠═╡ show_logs = false
Pkg.develop(path="..")

# ╔═╡ d578fb3c-6e89-4873-b6f8-61ae0e0611d2
# ╠═╡ show_logs = false
Pkg.add("Plots")

# ╔═╡ ceb16631-3276-4a91-b36c-f6677986b024
# ╠═╡ show_logs = false
Pkg.add("PlutoUI")

# ╔═╡ b83e8bf4-ee5a-4351-90c8-cf1277ffe081
using FastNoise2

# ╔═╡ 82466c59-2559-4968-bccf-c7eac129081a
using Plots

# ╔═╡ 42131b88-5478-43bb-9569-936101a260ae
using PlutoUI

# ╔═╡ 3ae9b65c-8938-4d1f-978c-0c504ff02b30
md"""
Noise kind: $(@bind noise_name Select(collect(keys(FastNoise2.NODE_NAMES_TO_ID));default="OpenSimplex2"))

Seed = $(@bind seed TextField(default="123"))

Frequency = $(@bind frequency Scrubbable([2^i / 10^3 for i in 1:10]; default=0.02, format=".3f"))

Start Position: X: $(@bind x Scrubbable(-100:100, default=0)) Y: $(@bind y Scrubbable(-100:100, default=0))
"""

# ╔═╡ 99cd580e-9304-439a-affe-52d3bdd96d5a
frequency, x, y

# ╔═╡ 86c171b0-a94b-4e24-97f8-bb0f3ce53ac4
n = Node(noise_name;seed=parse(Cint, seed))

# ╔═╡ d448e7d9-266c-4012-91f7-ffed233f356e
heatmap(n((32,32), x,y;frequency=frequency))

# ╔═╡ Cell order:
# ╠═856b2884-16f8-11ed-3fab-6122cef82810
# ╠═5ad3425d-42fc-414a-a6a2-7138569686f8
# ╠═d578fb3c-6e89-4873-b6f8-61ae0e0611d2
# ╠═ceb16631-3276-4a91-b36c-f6677986b024
# ╠═b83e8bf4-ee5a-4351-90c8-cf1277ffe081
# ╠═82466c59-2559-4968-bccf-c7eac129081a
# ╠═42131b88-5478-43bb-9569-936101a260ae
# ╟─3ae9b65c-8938-4d1f-978c-0c504ff02b30
# ╠═99cd580e-9304-439a-affe-52d3bdd96d5a
# ╠═86c171b0-a94b-4e24-97f8-bb0f3ce53ac4
# ╠═d448e7d9-266c-4012-91f7-ffed233f356e
