# Opciones de Biblioteca de Aserciones 📓

Las diferentes opciones contempladas haciendo uso del lenguaje de programación Julia son las siguientes:

## Test

El módulo [**Test.jl**](https://docs.julialang.org/en/v1/stdlib/Test/) proporciona una funcionalidad de prueba unitaria simple. La prueba unitaria es una forma de ver si el código es correcto al verificar que los resultados son los esperados. Es de gran utilidad para asegurarse de que el código sigue funcionando después de realizar cambios y que puede usarse durante el desarrollo, como si fuera una forma de especificar los comportamientos que debe tener el código cuando esté completo.

La nomenclatura habitual viene definida en este ejemplo:

```julia
@testset "trigonometric identities" begin
           θ = 2/3*π
           @test sin(-θ) ≈ -sin(θ)
end
```

En Julia se elimina la separación entre los métodos, las clases y los suites de pruebas que puede haber en otros lenguajes. En cambio, todo se mezcla en un concepto llamado `@testset`. Estos son más flexibles permitiéndo adaptar el marco de prueba a nuestas preferencias, ya que estos conjuntos pueden ser anidados. Adicionalmente proporciona funcionlidades para especificar tests que resultaran fallidos, con `@test_broken`, o la propia personalización del registro de los tests con [`AbstracTestSet`](https://docs.julialang.org/en/v1/stdlib/Test/#Creating-Custom-AbstractTestSet-Types).

## XUnit
Visto el caracter minimalista de la anterior librería, **XUnit.jl** pretende ser un reemplazo directo para las macros definidas por **Test.jl**. Esto quiere decir que la sintaxis es muy similar, pero da soporte a una serie de funcionalidades adicionales, como el poder jerarquizar en mayor medida la ejecución de los tests, una barra de progresión, ejecutar tests de manera distribuida... y otras más que podemos encontrar [en su reporsitorio](https://github.com/RelationalAI-oss/XUnit.jl).

## ReTest
Este es un marco de pruebas para Julia que permite, el filtrado de conjuntos de pruebas de ejecución con un `Regex` que se compara con las descripciones de los conjuntos de pruebas (siendo útil para ejecutar solo una parte del conjunto de pruebas) o la definición de tests en el mismo archivo que implementa las clases (siendo útil cuando se prefiere la definición de los métodos con su correspondiente test uno al lado del otro). Para más información acerca de otras funcionalidades, podemos visitar su [repositorio](https://github.com/JuliaTesting/ReTest.jl).

## Conclusiones

Las funcionalidades adicionales que proporcionan `XUnit` o `ReTest` son principalmente para cambiar su aspecto y pocas para cambiar su comportamiento, siendo este también posible a través de `Test`, solo que de manera algo más compleja. Por lo tanto y gracias a la completitud que proporciona el módulo `Test.jl`, hemos considerado que es suficiente para satisfacer la comprobación de las historias de usuario, las cuales pueden ser definidas de manera muy clara e intuitiva haciendo uso de los conjuntos `@testset`. En adición, para mejorar la robustez del marco de pruebas, utilizaremos como complemento a `Test.jl` la librería [**SafeTestsets.jl**](https://github.com/YingboMa/SafeTestsets.jl) para encapsular los `@testset` en un módulo, impidiendo así que los diferentes sets compartan variables que puedan causar errores.
