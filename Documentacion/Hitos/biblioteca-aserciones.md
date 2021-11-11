# Opciones de Biblioteca de Aserciones 📓

Las diferentes opciones contempladas haciendo uso del lenguaje de programación Julia son las siguientes:

## Test.jl

El módulo [**Test**](https://docs.julialang.org/en/v1/stdlib/Test/) proporciona una funcionalidad de prueba unitaria simple. La prueba unitaria es una forma de ver si el código es correcto al verificar que los resultados son los esperados. Es de gran utilidad para asegurarse de que el código sigue funcionando después de realizar cambios y que puede usarse durante el desarrollo, como si fuera una forma de especificar los comportamientos que debe tener el código cuando esté completo.

La nomenclatura habitual viene definida en este ejemplo:

```julia
@testset "trigonometric identities" begin
           θ = 2/3*π
           @test sin(-θ) ≈ -sin(θ)
end
```

Al proporcionar una funcionalidad simple, en adición haremos uso de la librería [**SafeTestsets.jl**](https://github.com/YingboMa/SafeTestsets.jl) para encapsular los `@testset` en un módulo, impidiendo así que los diferentes sets compartan variables que puedan causar errores.

## XUnit.jl
Visto el caracter simplista de la anterior librería, **XUnit.jl** pretende ser un reemplazo directo para las macros definidas por **Test.jl**. Esto quiere decir que la sintaxis es muy similar, pero da soporte a una serie de funcionalidades adicionales de las que podemos obtener más información [en su reporsitorio](https://github.com/RelationalAI-oss/XUnit.jl).
