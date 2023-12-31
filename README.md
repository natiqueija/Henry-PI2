<p align="center"><img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/4d8dc359-3286-445b-b43a-20c414ee35c3" width="350" height="250"></p>


<H1 align="center">Análisis del sector de telecomunicaciones en Argentina entre los años 2014 - 2022</H1>

Segundo proyecto individual realizado en la etapa de labs del bootcamp 'Data Scientist' de [Soy Henry](https://www.soyhenry.com/?utm_source=google&utm_medium=cpc&utm_campaign=GADS_SEARCH_ARG_BRAND&utm_content=brand&gad=1&gclid=Cj0KCQjw1OmoBhDXARIsAAAYGSFC2WWyy_RYznNkc6QevI2HP7hhqdfUyI1W1CofKjIFQpAZhyfTYccaAt-fEALw_wcB), en la cual una empresa prestadora de servicios de telecomunicaciones nos encarga la realización de un análisis completo que permita reconocer el comportamiento del sector a nivel nacional.

## Contexto

Las telecomunicaciones se refieren a la transmisión de información a través de medios electrónicos, como la telefonía, la televisión, la radio y, más recientemente, el internet. Estos medios de comunicación permiten la transmisión de información entre personas, organizaciones y dispositivos a largas distancias.

El internet, por su parte, es una red global de computadoras interconectadas que permite el intercambio de información en tiempo real. Desde su creación, ha tenido un impacto significativo en la vida de las personas, transformando la manera en que nos comunicamos, trabajamos, aprendemos y nos entretenemos.

La industria de las telecomunicaciones ha jugado un papel vital en nuestra sociedad, facilitando la información a escala internacional y permitiendo la comunicación continua incluso en medio de una pandemia mundial. La transferencia de datos y comunicación se realiza en su mayoría a través de internet, líneas telefónicas fijas, telefonía móvil, y en casi cualquier lugar del mundo.

En comparación con la media mundial, Argentina está a la vanguardia en el desarrollo de las telecomunicaciones, teniendo para el 2020 un total de 62,12 millones de conexiones.

## Introducción

En los últimos diez años, el análisis del desarrollo del sector del servicio de internet en Argentina ha revelado una creciente demanda tanto por parte de la sociedad como de las empresas en busca de una conectividad más eficiente y confiable. Sin embargo, este aumento en la necesidad de acceso a la red ha estado acompañado de un panorama diversificado en todo el país, donde el crecimiento no se ha distribuido de manera homogénea. Argentina es un país vasto y geográficamente diverso, además de ser un país federal, que ha experimentado un desafío considerable al tratar de garantizar que todas las regiones tengan igualdad de acceso y calidad de servicio en un contexto de demanda en constante expansión

## Fuente de datos 

Se utilizaron 10 [datasets](https://drive.google.com/drive/folders/1JWHz2DBdhBBAV7g60VJ5DMBgSbT4tSIE?usp=sharing) descargados de la página web de [ENACOM](https://datosabiertos.enacom.gob.ar/dashboards/20000/acceso-a-internet/), organismo gubernamental de Argentina encargado de regular y supervisar las comunicaciones en el país.
Este organismo tiene como función principal garantizar un entorno competitivo y equitativo en los sectores de las telecomunicaciones y los servicios de comunicación audiovisual.

- Internet-Penetracion: información acerca de la cantidad de accesos a internet por cada 100 habitantes y 100 hogares, para cada provincia de Argentina según el trimestre, desde el año 2014 a 2022.
- Internet-BAF: información acerca de la cantidad de la cantidad de accesos por método de conexión a internet, para cada provincia de Argentina, según el trimestre, desde el año 2014 a 2022.
- Internet-Accesos-Tecnología: información acerca de la cantidad de accesos por tecnología utilizada para la conexión a internet, a nivel nacional, según el trimestre, desde el año 2014 a 2022.
- historico_velocidad_internet: información acerca de la velocidad media de bajada para cada provincia de Argentina, según el trimestre, desde el año 2014 a 2022.
- Internet_accesos-por-velocidad: información acerca de la cantidad de accesos por velocidad de bajada (Mbps), para cada provincia de Argentina, según el trimestre, desde el año 2014 a 2022.
- Internet_ingresos: información acerca de los ingresos del sector a nivel nacional, para cada trimestre, desde el año 2014 a 2022, dispuestos en miles de pesos argentinos.
  
En este caso, hemos decidido no utilizarla como base para nuestro estudio por varias razones fundamentales.
En primer lugar, la falta de datos de inflación representa un obstáculo crítico para interpretar los valores en pesos argentinos. Durante este período, Argentina ha experimentado fluctuaciones significativas en su tasa de inflación, lo que significa que el valor real de los ingresos en pesos argentinos ha variado considerablemente a lo largo de los años. La falta de ajuste por inflación dificulta la comparación precisa y la interpretación de los datos, lo que compromete su utilidad para el estudio del crecimiento o decrecimiento de la industria.
Además, la base de datos carece de información detallada sobre la procedencia de los ingresos. No podemos determinar si los valores se refieren a una empresa en particular, a un subsector de la industria, o si representan el total de todos los actores del mercado. Esta ambigüedad en la fuente de los datos dificulta aún más su interpretación y su capacidad para proporcionar información relevante.
Igualmente podemos utilizarla como comparación con otros servicios para ver la relación entre ellos.

- Internet_Accesos-por-velocidad_por loc: información acerca de la cantidad de accesos por velocidad de bajada (Mbps), para cada localidad de Argentina hasta la fecha 7-Nov-2023.
- Internet-Accesos-por-tecno_por_loc: información acerca de la cantidad de accesos por tecnología utilizada para la conexión a internet, para cada localidad de Argentina hasta la fecha 7-Nov-2023.
- mapa_conectividad: información acerca de las localidades de Argentina, cantidad de población y si tienen o no conexiónes de las distintas tecnologías. 
- Telefonia_movil: información acerca del sector de telefonía móvil, desde cantidad de SMS enviados, llamadas salientes, minutos salientes, ingresos y cantidad de accesos para cada trimestre desde el año 2013 a 2022.


## Análisis exploratorio de los datos (EDA) y Transformaciones (ETL)

Para todos los datasets se realizó la siguiente metodología de trabajo:
1) Búsqueda de datos faltantes: en general no encontramos datos faltantes en los datasets.
2) Búsqueda de registros duplicados: en general no encontramos registros duplicados en los datasets.
3) Búsqueda de valores atípicos o outliers: se realizó la búsqueda a través de gráficos Boxplot, para los cuales, de encontrar datos atípicos se complementó con la búsqueda de dichos registros dentro del dataset a través del rango intercuartílico.
En este caso, para cada dataset encontramos que existen datos atípicos, principalmente relacionados a la disparidad en la concentración de la población en las provincias más desarrolladas tanto a nivel económico, educacional o de mayor producción en sectores que requieren de conexiones a internet.
4) Realizamos gráficos de líneas para hacer un primer análisis de la fluctuación de la información a través de los años.

Luego de este análisis llegamos a ciertas conclusiones inciales:
  - Se observa un notorio crecimiento en la disponibilidad de acceso a Internet en Argentina entre los años 2014 y 2022. Estos datos reflejan un aumento en la penetración de Internet en el hogar y un mayor acceso de la población a la tecnología, lo que puede tener un impacto significativo en la sociedad.
    Siendo la Capital Federal la que tiene mayor cantidad de accesos por cada 100 hogares y cada 100 habitantes. Esto puede deberse a la mayor concentración, no solo de habitantes, sino también de empresas prestadoras de servicios. 
    
  - Observamos también un crecimiento del acceso a la banda ancha fija, señal positiva de que cada vez más personas están optando por conexiones de mayor velocidad y calidad, lo que podría deberse a una mayor disponibilidad de infraestructura de banda ancha y una mayor demanda de servicios de Internet de alta velocidad.
    Vemos que las principales provincias que tienen crecimientos exponenciales en sus accesos a internet por banda ancha fija son Buenos Aires, Capital Federal, Santa Fé y Córdoba. Esto se puede deber a que son las principales provincias con mayor concentracion de personas en el pais, además de que son las capitales con mayor crecimiento educacional ya que son los centros universitarios mas grandes del país.
    
  - Una disminución de las conexiones Dial-up, lo cual es esperado y se puede ver también como es una tendencia a nivel mundial. Las conexiones Dial-up suelen ser más lentas y menos eficientes que las conexiones de banda ancha, por lo que es natural que disminuyan con el tiempo a medida que las personas buscan alternativas más rápidas y eficientes.
    Vemos que las provincias con mayores accesos a internet a través de Dial up en los comienzos fueron Neuquén, Mendoza y Chubut, además de Buenos Aires y Capital Federal. Se podría analizar la relación que tienen estas provincias con el desarrollo de los pozos petroleros y, por ende, las provincias con mayor poder adquisitivo.
    
  - Encontramos una brecha significativa entre banda ancha y Dial-up lo que sugiere que la mayoría de las personas han adoptado tecnologías de Internet más avanzadas. La banda ancha ofrece velocidades más rápidas, mejor capacidad de carga y descarga, y es más adecuada para las necesidades actuales de navegación web, transmisión de medios y trabajo en línea.
    
  - Vemos un aumento en la adopción de Cablemodem a lo largo de los años que podría deberse a que se han mejorado su infraestructura y capacidad, lo que ha hecho que el servicio sea más atractivo para los usuarios.
    En donde también encontramos que las provincias con mayores accesos a través de Cablemodem son Buenos Aires, Capital Federal, Santa Fé y Córdoba.
    
  - Hubo una disminución notable en el uso de ADSL que podría estar relacionada con la obsolescencia de esta tecnología en comparación con las opciones más rápidas, como el Cablemodem y la Fibra óptica.
    
  - Se registra también un aumento en la adopción de Fibra óptica a partir de 2018 que podría explicarse por la expansión de la infraestructura de fibra óptica en ese período.
    
  - La estabilidad y ligero aumento en el uso de Wireless puede deberse al hecho de que esta tecnología es ampliamente utilizada para conexiones móviles, como redes 4G y 5G, y no necesariamente para conexiones en el hogar.
    
  - La evolución de la media de bajada de la velocidad de Internet a nivel nacional ha experimentado un incremento notable en los últimos 4 años. Este aumento en la velocidad de descarga refleja una tendencia positiva en el acceso a Internet en el país, lo que significa que los usuarios tienen la capacidad de descargar datos y contenido de manera más rápida y eficiente. Este aumento puede estar relacionado con inversiones en infraestructura, avances tecnológicos y una mayor demanda de servicios de alta velocidad por parte de los usuarios.

## SQL

Se llevó a cabo un proceso que involucró la importación de archivos previamente limpiados utilizando Python en MySQL Workbench. Este paso fue esencial para la creación de nuestra base de datos relacional. Durante el proceso de importación, se realizaron varias tareas, que incluyeron la normalización de tablas y la creación de tablas clave, como la tabla "Calendario," la tabla "Partidos," y la tabla "Provincias." Esta normalización y estructuración de los datos permitieron que nuestra base de datos estuviera organizada y optimizada para el posterior análisis y consulta de información de manera eficiente.

## KPI´s

Por otro lado, se propone trabajar con 2 KPI´s principales:

1) Aumentar en un 2% el acceso al servicio de internet para el próximo trimestre, cada 100 hogares, por provincia.

El cual se puede observar que San Luis es la provincia con mayor aumento en el último trimestre en sus accesos con un 10,44 %, y el que menor registro tiene es la provincia de Formosa con un -9,94 %.
Las provincias que superaron el 2 % de aumento son San Luis y Corrientes.

2) Aumentar en un 100% el accesos al servicio de internet a través de Fibra Óptica por provincia en 1 año.

El cual se puede observar que 10 provincias superaron ese objetivo (Capital Federal, Corrientes, Formosa, La Rioja, Mendoza, Misiones, San Luis, Santa Fé, Santiago del Estero y Tierra del Fuego), de las cuáles resaltan San Luis y Santiago del Estero con aumentos de 3380% y 1040% respectivamente. Esto puede deberse a la implementación de políticas públicas por parte de las provincias para generar un aumento en la inversión de infraestructura y alcance de dicha tecnología para su provincia. Pero también es importante entender que el poco acceso previo a esta tecnología puede generar un aumento exponencial. 
Además, podemos ver que La Pampa es la provincia más atrasada en la migración hacia esa tecnología. 

## Gráficos principales

- Distribución de accesos según la tecnología
<div align="center">
    <img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/615d0685-104e-4fc8-b327-cff392f7e07d" alt="Distribucion de accesos según tecnología" width="50%">
</div>
<br>

Este gráfico de torta representa la distribución de tecnologías de acceso a Internet, el cual revela una clara predominancia del cablemódem sobre el resto de las tecnologías en la actualidad. Sin embargo, es importante considerar que la tecnología de acceso a Internet está en constante evolución. Con los avances tecnológicos y la creciente demanda de conexiones de alta velocidad y confiabilidad, es posible que esta relación cambie en el futuro. La fibra óptica, conocida por su capacidad para ofrecer velocidades de Internet significativamente más altas y una menor latencia, podría ganar más terreno a medida que los proveedores amplíen sus redes y los consumidores busquen experiencias de Internet más rápidas y eficientes. La inversión en infraestructura y la adopción de tecnologías emergentes serán factores clave que determinarán el futuro de las conexiones a Internet. Por lo tanto, es plausible esperar que la distribución de tecnologías de acceso a Internet continúe cambiando a medida que la tecnología avance para satisfacer las demandas cambiantes de los usuarios.

- Top 5 de provincias con mayor cantidad de accesos por cada 100 hogares y por cada 100 habitantes 
<div align="center">
    <img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/7848811d-fc31-4f42-a13d-e437a9ac4122" alt="Top 5 Provincias con mayor cantidad de accesos cada 100 hogares y habitantes" width="70%">
</div>
<br>

El análisis de las provincias con mayor cantidad de accesos a Internet por cada 100 habitantes y hogares, con La Pampa incluida en el top 5, ofrece una perspectiva interesante sobre la distribución de la conectividad en Argentina. Aunque La Pampa figura entre las provincias con una alta tasa de acceso a Internet, la investigación de la calidad de los accesos revela un aspecto crucial. A pesar de contar con una gran cantidad de conexiones, la velocidad de bajada promedio en La Pampa es significativamente inferior en comparación con otras provincias. Este hallazgo destaca la importancia de no solo considerar la cantidad de accesos, sino también la calidad y velocidad de la conexión. A pesar de tener una alta penetración de Internet, la experiencia del usuario en La Pampa puede verse limitada por la calidad de la conexión. Esto sugiere la necesidad de mejorar y actualizar la infraestructura de conectividad para garantizar que los usuarios puedan disfrutar de una experiencia de Internet más rápida y eficiente en esta provincia y en otras áreas con desafíos similares de calidad de conexión.

<div align="center">
  <p>*Buenos Aires*</p>
</div>

<div align="center">
    <img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/6bae7df5-1d90-432d-89d2-9dcea8676c7d" alt="Calidad de conexión en Buenos Aires" width="50%">
</div>
<br>

<div align="center">
  <p>*La Pampa*</p>
</div>

<div align="center">
    <img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/546bb97a-5f8b-40e4-820f-78e88c374306" alt="Calidad de conexión en La Pampa" width="50%">
</div>
<br>

- Top 5 de provincias con menor cantidad de accesos por cada 100 hogares y por cada 100 habitantes 
<div align="center">
    <img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/708139c5-5a41-44ba-9d60-242c3c199960" alt="Top 5 Provincias con menor cantidad de conexiones cada 100 hogares y habitantes" width="70%">
</div>
<br>

El gráfico de barras muestra que San Juan, Chaco, Santa Cruz, Santiago del Estero y Formosa son las cinco provincias con los menores accesos a Internet por cada 100 habitantes y hogares. Es importante destacar que el acceso a Internet es fundamental en la actualidad para el desarrollo de la educación, el trabajo y la vida cotidiana. Por lo tanto, es necesario seguir trabajando para reducir la brecha digital y garantizar que todas las personas tengan acceso a la tecnología y a la información que necesitan para mejorar su calidad de vida.

- Accesos cada 100 habitantes por localidad a nivel nacional (para localidades con más de 10.000 habitantes)
<div align="center">
    <img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/324d70e2-516d-480e-a758-713ca7764399" alt="Accesos cada 100 habitantes por localidad" width="70%">
</div>
<br>
  
- Accesos cada 100 habitantes por localidades de Buenos Aires (para localidades con más de 10.000 habitantes)
<div align="center">
    <img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/ede1ab4f-b2c1-4c95-af5a-c82363b66e1a" alt="Accesos cada 100 habitantes por localidad" width="70%">
</div>
<br>

- Promedio de accesos cada 100 habitantes según los accesos a internet y a telefonía móvil
<div align="center">
    <img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/a8e2df23-d07d-4977-baf8-35d28136c8b8" alt="Promedio de accesos cada 100 habitantes según internet y telefonía" width="70%">
</div>
<br>

El gráfico de lineas muestra un breve descenso en la cantidad de accesos en el servicio de telefonía móvil y por otro lado un pequeño crecimiento en el acceso a los servicios de internet. Igualmente, hay una gran brecha entre ambas líneas, donde la cantidad de accesos a telefonía móvil es mucho mayor que la de Internet.
Esto puede deberse a diferentes factores como por ejemplo, el costo del servicio, donde el acceso a Internet puede ser costoso, especialmente en áreas rurales o remotas. Por otro lado, los planes de telefonía móvil pueden ser más asequibles y accesibles para la mayoría de las personas. Por otro lado, la infraestructura necesaria para proporcionar acceso a Internet puede ser costosa y difícil de implementar en áreas remotas. Además, la infraestructura necesaria para proporcionar acceso a telefonía móvil es más fácil de implementar y puede cubrir un área más amplia.

- Evolución de ingresos en miles de pesos como comparación entre los sectores de servicios de internet y servicios de telefonía móvil
<div align="center">
    <img src="https://github.com/natiqueija/Henry-PI2/assets/109183272/0502baee-f91d-4052-863e-cb43db3a224b" alt="Evolución de ingresos" width="80%">
</div>
<br>

A pesar de que la información sobre los ingresos no pueden ser considerados como tal, por no ser valores constantes, podemos analizar la diferencia entre los ingresos de ambos servicios. En este caso podemos ver que los servicios de telefonía móvil generaron mayores ingresos a lo largo de los años que los servicios de internet.

## Contacto 

- Mail: natiqueija@gmail.com
- Linkedin: [Natalia Queija](https://www.linkedin.com/in/natalia-queija/)
