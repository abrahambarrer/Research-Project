#let formato_apa(
  titulo: "",
  autor: "",
  afiliacion: "",
  curso: "",
  instructor: "",
  fecha: "",
  cuerpo,
) = {
  // 1. Configuración de página inicial (Sin número de página para Portada e Índice)
  set page(
    paper: "us-letter",
    margin: 1in,
  )

  // 2. Configuración de texto
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "es",
  )

  // 3. Configuración de párrafo
  set par(
    leading: 9pt,
    first-line-indent: 0.5in,
    justify: true,
  )

  // 4. Configuración de Títulos

  show heading: set block(above: 24pt, below: 15pt)

  show heading: it => {
    set text(font: "Gill Sans MT", size: 15pt, weight: "bold")
    set align(left)
    it
  }

  set enum(spacing: 1.5em)

  // --- PORTADA ---
  // --- PORTADA INSTITUCIONAL (UV) ---

  // 1. Gráfico inferior izquierdo (Ignoramos los márgenes con dx y dy)
  place(bottom + left, dx: -1in, dy: 1in)[
    // Descomenta la siguiente línea cuando tengas tu imagen lista:
    #image("../images/background.png", width: 4.5in)
  ]

  // 2. Contenido alineado a la derecha
  align(right)[

    // Logotipo UV
    #image("../images/logo_uv.png", width: 1in)

    // Encabezado
    #text(font: "Gill Sans MT", size: 14pt, weight: "bold")[Universidad Veracruzana] \
    // Línea separadora adaptada al texto
    #align(right)[#line(length: 150pt, stroke: 0.7pt)]
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Facultad de Contaduría y Administración] \
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Región Coatzacoalcos-Minatitlán] \

    #v(2em)

    // Programa educativo
    #text(font: "Gill Sans MT", size: 12pt, weight: "bold")[Programa educativo] \
    #text(font: "Gill Sans MT", size: 11pt, fill: rgb("#777777"))[Ingeniería de Software] \

    // Experiencia Educativa
    #text(font: "Gill Sans MT", size: 12pt, weight: "bold")[Experiencia Educativa] \
    #text(font: "Gill Sans MT", size: 11pt, fill: rgb("#777777"))[#curso] \

    #v(3em)

    // Título
    #text(font: "Gill Sans MT", size: 16pt, weight: "bold")[Anteproyecto de Investigación] \
    #v(0.5em)
    #text(font: "Gill Sans MT", size: 13pt, fill: rgb("#777777"))[#titulo] \

    #v(4em)

    // Presentan
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Presentan:] \
    #text(font: "Gill Sans MT", size: 11pt, weight: "bold", fill: rgb("#777777"))[#autor] \

    #v(2em)

    // Grupo
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Grupo:] \
    #text(font: "Gill Sans MT", size: 11pt, fill: rgb("#777777"))[LIS-701] \

    #v(2em)

    // Docente
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Docente:] \
    #text(font: "Gill Sans MT", size: 11pt, fill: rgb("#777777"))[#instructor] \

    #v(4em)

    // Fecha y Lema
    #text(font: "Gill Sans MT", size: 10pt)[Coatzacoalcos, Ver., #text(fill: rgb("#777777"))[#fecha]] \
    #v(1em)
    #text(font: "Gill Sans MT", size: 10pt)[“Lis de Veracruz: Arte, Ciencia, Luz”]
  ]

  // Salto de página sin el símbolo #
  pagebreak()

  // --- ÍNDICE ---
  // También sin el símbolo #
  outline(
    title: "Índice",
    indent: auto,
  )

  pagebreak()

  // --- ÍNDICE DE FIGURAS ---

  outline(
    title: [Índice de Tablas y Figuras],
    target: figure,
  )

  // --- CONFIGURACIÓN DEL CONTENIDO PRINCIPAL ---
  // A partir de aquí encendemos el encabezado.
  set page(
    header: context align(right)[#counter(page).display()],
  )

  // Inyectamos el texto del documento
  cuerpo
}

// ==========================================
// APLICACIÓN DE LA PLANTILLA Y TU CONTENIDO
// ==========================================

#show: formato_apa.with(
  titulo: "Habilidades requeridas por los ingenieros de software ante la llegada de la IA",
  autor: "Abraham Giovani Barrera Torres",
  afiliacion: "Facultad de Contaduría y Administración, Universidad Veracruzana",
  curso: "Proyecto Guiado",
  instructor: "Dra. Ma. Teresa de la Luz Sainz Barajas",
  fecha: "16 de septiembre de 2026",
)

// Primeros títulos sin numeración
#set heading(numbering: none)

= Resumen

La integración de agentes de codificación y modelos de inteligencia artificial generativa transformó la forma en que se planifican, diseñan, construyen y validan los proyectos de software. Ante este cambio de paradigma, resulta necesario reconocer las prácticas, metodologías y competencias que se requieren de los ingenieros de software, así como los criterios que deben orientar su formación académica. El objetivo de la investigación consiste en analizar las prácticas de diseño arquitectónico, las dinámicas de comunicación y colaboración, las metodologías de trabajo, la estructura del ciclo de vida y las prácticas de validación de la calidad en el desarrollo de software asistido por IA.

El estudio tiene un enfoque descriptivo, cualitativo, no experimental y de temporalidad transversal. Se empleó la técnica de Revisión Sistemática de la Literatura (RSL), conforme a las directrices de Kitchenham y Charters. Se aplicaron cinco cadenas de búsqueda, una por cada pregunta de investigación, en las bases de datos IEEE, ACM Digital Library, Scopus, ScienceDirect y arXiv, para el periodo 2020-2026. De 58,055 registros recuperados, un proceso de selección en tres etapas con criterios de inclusión y exclusión permitió identificar 30 estudios, cuya calidad se evaluó mediante un cuestionario de 12 preguntas.

Los hallazgos indican que la IA actúa como facilitador del diseño de alto nivel, siempre que el ingeniero guíe el proceso y especifique con precisión. Metodologías emergentes como Command Coding, CICAP y Specification-Driven Development han reducido el tiempo de desarrollo en hasta 60%. El ciclo de vida se extiende hacia una etapa previa de ideación y se apoya en la IA en cada fase. Los equipos tienden a reducirse y a delegar las tareas rutinarias a la IA, y la calidad del código se asegura mediante una validación en múltiples capas.

= Palabras clave

Es un conjunto de 3 a 4 palabras relacionadas con el contenido del anteproyecto,
que sirven para facilitar la búsqueda por parte de otros investigadores.

// ==========================================
// ENCENDEMOS LA NUMERACIÓN PARA EL RESTO DEL TEXTO
// ==========================================
#set heading(numbering: "1.1.")
#counter(heading).update(0) // Reiniciamos el contador a 0. El próximo será el 1.

#pagebreak()

= Situación problemática y problema de investigación

Desde sus inicios en 1968 en la OTAN, los modos y técnicas de hacer Software han evolucionado 
debido a la investigación de nuevos métodos y sobre todo a las tecnologías e infraestructura
de cómputo. También es cierto que hay principios que permanecen vigentes y que fundamentan
el enfoque sistemático del desarrollo. Para #cite(<11645215>, form: "prose"), la abstracción,
el refinamiento sucesivo, divide y vencerás, y, a favor de hacer software para el ciudadano común,
la integración de los resultados de investigación científica en software interdisciplinar (Internet
de las Cosas, algoritmos genéticos, etc.). Es así como la Ingeniería de Software ha tenido cambios
constantes que se han dirigido desde un enfoque en el hardware hacia una visión centrada en el
usuario. El software ya no es solamente un sistema de uso científico o ingenieril,
sino que se ha convertido en un producto de uso cotidiano accesible para el público general.

Por otro lado, la historia de la inteligencia artificial como disciplina también ha tenido avances
cada vez más rápidos en los campos de deep learning y redes neuronales profundas. Pero fue en el
año de 2024 cuando aumentaron las herramientas y tecnologías potenciadas por asistentes de codificación
que el uso de inteligencia artificial en el desarrollo de software cobró relevancia. Los agentes de
IA ya eran capaces de interactuar con herramientas de terceros, realizar búsquedas en la web, y actuar
sobre el entorno digital, dejando de ser una herramienta secundaria a un componente activo en el
desarrollo. Para 2025, el científico Andrej Karpathy hizo uso del concepto de “Vibe Coding” para
referirse a la generación de código mediante lenguaje natural.

Como ingeniería, siempre ha sido de interés el aumentar la eficiencia en el desarrollo de proyectos.
Primariamente, las dinámicas en los equipos de trabajo, los procesos y metodologías como Scrum han
agilizado los tiempos de los proyectos, pero el uso de inteligencia artificial ha mejorado considerablemente
el ritmo de trabajo. #cite(<11404330>, form: "prose") señalan que se han observado tiempos de desarrollo
que se reducen de meses a semanas o días al examinar los resultados del vibe coding en proyectos reales.
Los equipos de trabajo pueden dedicar más tiempo a la innovación, prototipos y lógica de negocio
debido a la automatización de generación de código.

Frente a esta situación, quienes ignoran el uso de la inteligencia artificial
se encuentran en posición de desventaja para hacer frente a las necesidades del
desarrollo moderno, que exige tiempos y dinámicas más rápidas. Si el vibe coding
resulta ahora indispensable para el desarrollo, entonces el problema es reconocer
las nuevas prácticas, habilidades, procesos y metodologías que respondan
eficientemente a las tendencias actuales.

A partir de esta transición del desarrollo tradicional hacia un modelo fundamentado en
la orquestación mediante agentes autónomos de inteligencia artificial, surge la necesidad
de replantear los principios actuales de la disciplina. Este trabajo pretende determinar cuáles son
las metodologías, competencias críticas y criterios educativos que deben estructurar la formación y el
desempeño de los ingenieros de software, que garanticen la efectividad operativa del desarrollo.

#pagebreak()

= Revisión teórica

#set enum(numbering: "1.1.", full: true)

1. Competencias técnicas actuales que exige la industria del software.
  1. Herramientas de desarrollo de IA: GitHub Copilot y otros agentes.
  2. Generación de arquitectura de software con el uso de inteligencia artificial.
  3. Prácticas de desarrollo de software seguro con inteligencia artificial
2. Habilidades blandas en el desarrollo de software.
  1. Ingeniería de prompts para la claridad en el desarrollo
  2. Colaboración en el desarrollo de software con IA
  3. Desarrollo del pensamiento crítico con asistentes de desarrollo
  4. Empatía con stakeholders en las decisiones de desarrollo de software
3. Metodologías modernas de desarrollo con inteligencia artificial.
  1. Metodologías ágiles potenciadas con agentes de IA.
  2. Ingeniería de requisitos dirigida por IA.
  3. Pruebas de Software dirigidas por IA.
  4. Cambios en los roles de trabajo en el ciclo de vida de software.
  5. AIOps para las operaciones de construcción de software
4. Marco actual de la educación de Ingeniería de Software.
  1. Currículums para el aprendizaje de desarrollo de software dirigido por IA
  2. Aprendizaje del pensamiento computacional con IA.
  3. Enseñanza del ciclo de vida del software con IA

= Antecedentes de investigación y del contexto

#lorem(100)

= Planteamiento del problema

== Pregunta de investigación

+ ¿Cuáles son las habilidades y conocimientos técnicos que adquieren mayor importancia cuando la generación de código es impulsada principalmente por IA?
+ ¿Qué habilidades blandas cobran relevancia en los nuevos entornos de desarrollo asistidos por IA?
+ Si el desarrollo se lleva a cabo con el uso de agentes de IA, ¿cuáles son las metodologías de trabajo y procesos ideales para optimizar el desarrollo?
+ ¿Cuál es el enfoque actual en la formación académica de los estudiantes y profesionales de ingeniería de software que contempla la integración de agentes de codificación?

== Objetivo General

Analizar los conocimientos, tecnologías, competencias y criterios de formación académica que
requieren los ingenieros de software ante la tendencia de integrar agentes autónomos
de inteligencia artificial en el desarrollo de software.

== Objetivos Específicos

+ Identificar las habilidades técnicas y tecnologías que son relevantes para los ingenieros de software cuando la generación de código es impulsada principalmente por IA.
+ Examinar las habilidades blandas de los ingenieros de software en un contexto de menor codificación manual debido al desarrollo asistido por IA.
+ Determinar las metodologías de trabajo y procesos que optimizan los recursos de un proyecto de desarrollo de software mediante la orquestación de agentes de IA.
+ Definir criterios que orienten la formación académica de estudiantes y profesionales en el estudio de la ingeniería de software frente al cambio de metodologías de trabajo con IA.

== Hipótesis

#lorem(100)

= Justificación del problema 

La industria de desarrollo de software actual demanda tiempos de entrega cada vez más rápidos y cortos
plazos de tiempo, lo cual implica presión que generan ciertos conflictos que afectan el proyecto.
#cite(<7961895>, form: "prose") indican que los problemas asociados con la presión en tiempos de entrega
incluyen una mayor probabilidad de cometer errores, mayor número de defectos, trabajo posterior al despliegue,
falta de coordinación en los equipos de trabajo, etc.

En el panorama actual, la construcción de software utilizando IA generativa ha significado una
contribución importante para acelerar los proyectos y mejorar los tiempos de entrega. 
Evaluaciones realizadas por #cite(<11438791>, form: "prose"), tras analizar 50 proyectos de software,
encontraron que un framework impulsado por IA generativa logró la reducción de 50.6% en el tiempo de
desarrollo en todo el ciclo de vida del software.

La investigación actual tiene como proposito determinar las tendencias actuales de construcción de
software y se justifica debido a implicaciones relevantes para con las exigencias de la industria del
desarrollo. Debido al cambio de paradigma de la forma de hacer ingeniería de software las funciones de
los ingenieros se han replanteado y es pertinente identificar formalmente cuáles son estas nuevas prácticas,
metodologías, y enfoques actuales. Asimismo, tiene importancia académica, ya que si los modos de desarrollo
ha cambiado, entonces para cubrir estos conocimientos se requieren otras rutas de aprendizaje.

Esta investigación se considera viable ya que se fundamenta en la revisión documental de literatura científica
publicada entre 2020 y 2026 procedente de las bases de datos IEEE, ACM Digital Library y SpringerLink. 

= Diseño de la investigación

Para establecer la estrategia del trabajo, se toman en cuenta las contribuciones a la metodología de investigación de #cite(<sampieri2014metodología>, form: "prose").

El estudio tiene un enfoque descriptivo cuyo objeto de estudio son las tendencias actuales de desarrollo de software y su adaptación para el aprendizaje. Por tal motivo, es una investigación cualitativa y no experimental ya que se fundamenta en la revisión de literatura científica para la comprensión de las prácticas de construcción de software modernas. Debido al enfoque descriptivo, no hay manipulación de variables que deban estudiarse por un periodo longitudinal. En tal caso, se trata de una investigación de temporalidad transversal con respecto a la recopilación de información científica.

= Técnica e instrumentos de investigación

La técnica seleccionada fue la Revisión Sistemática de la Literatura (RSL), desarrollada bajo las directrices metodológicas de Kitchenham y Charters. Esta técnica se eligió porque ofrece un procedimiento explícito, replicable y auditable para identificar, filtrar y sintetizar la evidencia científica disponible sobre un tema. Dado que la integración de la IA en la ingeniería de software es un campo reciente y con una producción de literatura acelerada, la RSL permite delimitar qué se ha estudiado, con qué rigor y con qué resultados, sin depender de la selección arbitraria de fuentes. 

Dado que la investigación se basa en la revisión documental, los sujetos de estudio son publicaciones científicas. La población se conformó por la literatura indexada en cinco bases de datos: IEEE Xplore, ACM Digital Library, Scopus, ScienceDirect y arXiv. IEEE y ACM concentran gran parte de la producción especializada en ingeniería de software y ciencias de la computación. Scopus y ScienceDirect son de enfoque multidisciplinar y revistas arbitradas, mientras que arXiv permite acceder a versiones preliminares de artículos. Esto es relevante porque los marcos de trabajo con IA son tan nuevos que parte de la evidencia aún no pasa por los ciclos habituales de publicación.

El proceso inició con la formulación de cinco preguntas de investigación, a partir de las cuales se definieron cinco cadenas de búsqueda en los siguientes ámbitos de desarrollo con IA: etapas del ciclo de vida, metodologías de trabajo con inteligencia artificial, diseño arquitectónico, dinámicas de colaboración, comunicación y pensamiento crítico y validación de la calidad del código generado con IA. Cada cadena combinó términos relativos a la ingeniería de software, a la IA generativa y al aspecto específico de interés. Se adaptó la sintaxis de búsqueda a cada base de datos y se limitó el periodo de publicación a 2020-2026.

Los resultados se depuraron en tres etapas. En la primera se aplicaron criterios formales (periodo de publicación, idioma y acceso completo al documento). En la segunda se revisaron el título y el resumen y se descartaron los estudios ajenos al área de ingeniería o computación, así como las presentaciones y los reportes técnicos. En la tercera se leyó el contenido completo y se eliminaron duplicados para únicamente los estudios que respondían al menos una pregunta de investigación. De los 58,055 registros recuperados, 13,097 superaron la primera etapa, 501 la segunda y 30 la tercera.

Los instrumentos empleados fueron las cadenas de búsqueda, la tabla de criterios de inclusión y exclusión, y el cuestionario de calidad propuesto por Kitchenham, compuesto por 12 preguntas con respuesta afirmativa (1 punto), parcial (0.5) o negativa (0). Se puso especial énfasis en las preguntas 3, 4 y 5, relativas a la recopilación de datos. Las fuentes con una puntuación menor a 2 se identificaron como estudios secundarios o propuestas teóricas sin datos empíricos.

Para el análisis de los datos se elaboraron tablas de síntesis por pregunta de investigación y figuras descriptivas sobre la distribución de los estudios por año, el tipo de investigación y la proporción de estudios que proponen marcos de trabajo. Estas permitieron contrastar los hallazgos de cada fuente y derivar las conclusiones.

// Referencias
#pagebreak()

#bibliography("../references.bib", style: "apa")
