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
  titulo: "Ciclo de Vida, Marcos de Trabajo y Prácticas de la Ingeniería de Software en la era de la IA",
  autor: "Abraham Giovani Barrera Torres",
  afiliacion: "Facultad de Contaduría y Administración, Universidad Veracruzana",
  curso: "Proyecto Guiado",
  instructor: "Dra. Ma. Teresa de la Luz Sainz Barajas",
  fecha: "9 de noviembre de 2026",
)

// Primeros títulos sin numeración
#set heading(numbering: none)

= Introducción

El presente trabajo es un reporte de revisión sistemática de la literatura (RSL) desarrollado bajo las directrices metodológicas de Kitchenham y Charters. La investigación aborda la transformación de la ingeniería de software ante la integración de agentes de codificación y modelos de inteligencia artificial generativa en el ciclo de vida del desarrollo. Se examinarán las metodologías propuestas que integran IA en el desarrollo de proyecto de software y cómo cambian las dinámicas de trabajo y las competencias de trabajo..

// ==========================================
// ENCENDEMOS LA NUMERACIÓN PARA EL RESTO DEL TEXTO
// ==========================================
#set heading(numbering: "1.1.")
#counter(heading).update(0) // Reiniciamos el contador a 0. El próximo será el 1.

#pagebreak()

= Fundamentos

== Planteamiento del problema

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

== Objetivo de la RSL

#set enum(numbering: "1.1.", full: true)

=== Objetivo General:
Analizar los conocimientos, tecnologías, competencias y criterios de formación académica que requieren los ingenieros de software ante la tendencia de integrar inteligencia artificial en el desarrollo de proyectos software.

=== Objetivos Específicos:

1. Identificar las prácticas actuales de diseño de arquitectura y desarrollo de sistemas de los ingenieros de software potenciadas con el uso de IA.
2. Examinar la comunicación, pensamiento crítico y trabajo colaborativo de los ingenieros de software en un contexto de trabajo asistido por IA.
3. Determinar las metodologías de trabajo y procesos que optimizan los recursos de un proyecto de desarrollo de software mediante la orquestación de agentes de IA.
4. Analizar cómo se estructuran las etapas del ciclo de vida del software en los modelos que integran IA.
5. Identificar las prácticas de validación y aseguramiento de la calidad que emplean los ingenieros de software para mitigar los riesgos del código generado por agentes de IA. 

== Pregunta de investigación

+ ¿Cuáles son las prácticas de los ingenieros de software en el diseño arquitectónico de sistemas cuando el proceso de desarrollo es dirigido por IA? 
+ ¿De qué manera la integración de la IA generativa redefine la comunicación técnica, el pensamiento crítico y la colaboración en los equipos de desarrollo de software?
+ Si el desarrollo se lleva a cabo con el uso de agentes de IA, ¿cuáles son las metodologías de trabajo y procesos que resultan más efectivos para optimizar el desarrollo?
+ ¿Cómo se estructuran las etapas del ciclo de vida de software con la integración de IA?
+ ¿Qué prácticas de validación y aseguramiento de la calidad emplean los ingenieros de software para mitigar los riesgos del código generado por agentes de IA? 

== Justificación

La industria de desarrollo de software actual demanda tiempos de entrega cada vez más rápidos y cortos plazos de tiempo, lo cual implica presión que generan ciertos conflictos que afectan el proyecto. #cite(<7961895>, form: "prose") indican que los problemas asociados con la presión en tiempos de entrega incluyen una mayor probabilidad de cometer errores, mayor número de defectos, trabajo posterior al despliegue, falta de coordinación en los equipos de trabajo, etc.

En el panorama actual, la construcción de software utilizando IA generativa ha significado una contribución importante para acelerar los proyectos y mejorar los tiempos de entrega. Evalua­ciones realizadas por #cite(<11438791>, form: "prose"), tras analizar 50 proyectos de software, se encontró que un framework impulsado por IA generativa logró la reducción de 50.6% en el tiempo de desarrollo en todo el ciclo de vida del software.

La investigación actual tiene como propósito determinar las tendencias actuales de cons­trucción de software y se justifica debido a implicaciones relevantes para con las exigencias de la industria del desarrollo. Debido al cambio de paradigma de la forma de hacer ingeniería de software las funciones de los ingenieros se han replanteado y es pertinente identificar formalmente cuáles son estas nuevas prácticas, metodologías, y enfoques actuales.

Esta investigación se considera viable ya que se fundamenta en la revisión documental de literatura científica publicada entre 2020 y 2026 procedente de las bases de datos IEEE, ACM Digital Library, Science Direct, Scopus y Arxiv. 

= Método

== Criterios de inclusión y exclusión

=== Criterios de inclusión

+ Papers, capítulos de libros, y artículos de revistas publicados entre los años 2020 y 2026. (CI1)
+ Papers escritos en inglés. (CI2)
+ Papers con acceso completo. (CI3)
+ Título y el abstract puedan dar respuesta al menos una pregunta de investigación. (CI4)
+ Leyendo el contenido responde al menos una pregunta de investigación. (CI5)

=== Criterios de exclusión

+ En fuentes multidisciplinarias, el estudio no está en el área de Ingeniería o Computer Science. (CE1)
+ La publicación es una presentación o reporte técnico. (CE2)
+ Papers duplicados. (CE3)
+ Después de leer los paper, no aborda ninguna pregunta de investigación. (CE4)

== Proceso de búsqueda


#figure(
  table(
    // 5 columnas: la primera más ancha (auto), las demás del mismo tamaño (1fr)
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    // Centrar el contenido vertical y horizontalmente
    align: (col, row) => if col == 0 { horizon + left } else { horizon + center },
    
    // Encabezados
    [], [Search], [Stage 1], [Stage 2], [Stage 3],

    // Fila 1
    [IEEE], [2118], [169], [12], [2],

    // Fila 2
    [ACM Digital\ Library], [231], [220], [12], [1],

    // Fila 3
    [Scopus], [3829], [531], [9], [2],

    // Fila 4
    [ArXiv], [1607], [1559], [22], [2],

    // Fila 5
    [Science Direct], [633], [234], [9], [0],

    // Fila 6 (Total)
    [Total], [8418], [2713], [64], [*7*],
  ),
  caption: [Resultados de la cadena de búsqueda 1]
) <busqueda-1>

#figure(
  table(
    // 5 columnas: la primera más ancha (auto), las demás del mismo tamaño (1fr)
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    // Centrar el contenido vertical y horizontalmente
    align: (col, row) => if col == 0 { horizon + left } else { horizon + center },
    
    // Encabezados
    [], [Search], [Stage 1], [Stage 2], [Stage 3],

    // Fila 1
    [IEEE], [2656], [261], [24], [1],

    // Fila 2
    [ACM Digital\ Library], [226], [216], [15], [3],

    // Fila 3
    [Scopus], [1514], [256], [37], [3],

    // Fila 4
    [ArXiv], [580], [580], [23], [2],

    // Fila 5
    [Science Direct], [2826], [1098], [23], [0],

    // Fila 6 (Total)
    [Total], [7802], [2411], [122], [*9*],
  ),
  caption: [Resultados de la cadena de búsqueda 2]
) <busqueda-2>

#figure(
  table(
    // 5 columnas: la primera automática, las demás proporcionales
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    // Alineación: izquierda para texto, centrado para números
    align: (col, row) => if col == 0 { horizon + left } else { horizon + center },
    
    // Encabezados
    [], [Search], [Stage 1], [Stage 2], [Stage 3],

    // Filas de datos
    [IEEE], [825], [28], [9], [2],
    [ACM Digital\ Library], [70], [38], [8], [1],
    [Scopus], [406], [63], [12], [1],
    [ArXiv], [8893], [1071], [26], [2],
    [Science Direct], [15835], [2486], [14], [0],

    // Fila Total
    [Total], [26029], [3686], [69], [*6*],
  ),
  caption: [Resultado de la cadena de búsqueda 3],
) <busqueda-3>

#figure(
  table(
    // 5 columnas: la primera automática, las demás proporcionales
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    // Alineación: izquierda para texto, centrado para números
    align: (col, row) => if col == 0 { horizon + left } else { horizon + center },
    
    // Encabezados
    [], [Search], [Stage 1], [Stage 2], [Stage 3],

    // Filas de datos
    [IEEE], [1995], [206], [48], [1],
    [ACM Digital\ Library], [150], [118], [26], [2],
    [Scopus], [1929], [326], [9], [1],
    [ArXiv], [545], [472], [14], [2],
    [Science Direct], [911], [357], [57], [1],

    // Fila Total
    [Total], [5530], [1479], [154], [*7*],
  ),
  caption: [Resultado de la cadena de búsqueda 4],
) <busqueda-4>

#figure(
  table(
    // 5 columnas: la primera automática, las demás proporcionales
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    // Alineación: izquierda para texto, centrado para números
    align: (col, row) => if col == 0 { horizon + left } else { horizon + center },
    
    // Encabezados
    [], [Search], [Stage 1], [Stage 2], [Stage 3],

    // Filas de datos
    [IEEE], [1242], [83], [8], [0],
    [ACM Digital\ Library], [300], [275], [44], [0],
    [Scopus], [1264], [238], [18], [0],
    [ArXiv], [739], [432], [17], [1],
    [Science Direct], [6731], [1780], [5], [0],

    // Fila Total
    [Total], [10276], [2808], [92], [*1*],
  ),
  caption: [Resultado de la cadena de búsqueda 5],
) <busqueda-5>

== Evaluación de calidad

#figure(
  table(
    // 2 columnas: la primera toma el espacio disponible (1fr), la segunda se ajusta al contenido (auto)
    columns: (1fr, auto),
    // Alineación: izquierda para las preguntas, centrado para las respuestas Y/N/P
    align: (col, row) => if col == 0 { horizon + left } else { horizon + center },
    
    // Encabezados
    [*Pregunta*], [*Respuesta*],

    // Filas de datos
    [¿Están claramente especificados los objetivos de la investigación?], [Y/N/P],
    [¿El estudio fue diseñado para lograr objetivos?], [Y/N/P],
    [¿Se describen claramente las técnicas utilizadas y se justifica su selección?], [Y/N/P],
    [¿Se miden adecuadamente las variables consideradas por el estudio?], [Y/N/P],
    [¿Se describen adecuadamente los métodos de recopilación de datos?], [Y/N/P],
    [¿Se describen adecuadamente los datos recopilados?], [Y/N/P],
    [¿Es claro el propósito del análisis de datos?], [Y/N/P],
    [¿Se utilizan técnicas estadísticas para analizar los datos adecuadamente descritos y su uso está justificado?], [Y/N/P],
    [¿Se presentan resultados negativos (si los hay)?], [Y/N/P],
    [¿Los investigadores discuten algún problema con la validez/confiabilidad de los resultados?], [Y/N/P],
    [¿Se responden adecuadamente todas las preguntas de investigación?], [Y/N/P],
    [¿Qué tan claros son los vínculos entre los datos, la interpretación y las conclusiones?], [Y/N/P],
  ),
  caption: [Preguntas para la evaluación de calidad],
) <evaluacion-calidad>

Para la evaluación de la calidad de las fuentes se tomaron en cuenta los criterios de Kitchenham. Se hizo especial énfasis en las preguntas de calidad 3,4 y 5 sobre la recopilación de datos. Aquellas fuentes que tenían una puntuación menor a 2 eran fuentes de índole secundaria o propuestas teóricas sin datos empíricos.

#show figure.where(kind: table): set block(breakable: true)

#figure(
  table(
    columns: (auto, 1fr, ..range(12).map(_ => auto), auto),
    align: (center + horizon, left + horizon, ..range(13).map(_ => center + horizon)),
    stroke: 0.5pt,
    
    // Encabezados repetibles en cada página
    table.header(
      [*ID*], [*Título del Artículo*], [*Q1*], [*Q2*], [*Q3*], [*Q4*], [*Q5*], [*Q6*], [*Q7*], [*Q8*], [*Q9*], [*Q10*], [*Q11*], [*Q12*], [*P*]
    ),

    // Filas de datos
    [1], [A-SAW: The Agentic Software Architecture Workflow], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [2], [A Comprehensive Framework for Intelligent, Scalable, and Performance-Optimized Software Development], [Y], [Y], [P], [P], [N], [N], [P], [P], [Y], [N], [N], [N], [4.5],
    [3], [A Framework for Evaluating GenAI Adoption and Use in Software Engineering], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [4], [Agentic AI in the Software Development Lifecycle: Architecture, Empirical Evidence, and the Reshaping of Software Engineering], [Y], [Y], [N], [N], [N], [P], [Y], [N], [Y], [N], [P], [Y], [6.0],
    [5], [Are We All Using Agents the Same Way An Empirical Study of Core and Peripheral Developers Use of Coding Agents], [], [], [], [], [], [], [], [], [], [], [], [], [],
    [6], [Better Together: An LLM-Assisted Approach to Designing Software Architectures Using Attribute-Driven Design], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [7], [CICAP: A Human-AI Co-creation Paradigm for Ethical and Efficient Plugin Development in Moodle], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [N], [Y], [11.0],
    [8], [Code with Me or for Me? How Increasing AI Automation Transforms Developer Workflows], [], [], [], [], [], [], [], [], [], [], [], [], [],
    [9], [Command Coding: A Methodological Framework for AI-Accelerated Software Development], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [10], [Copiloting the future: How generative AI transforms Software Engineering], [Y], [Y], [Y], [P], [Y], [Y], [Y], [Y], [Y], [P], [Y], [Y], [11.0],
    [11], [Empowering Agile-Based Generative Software Development through Human-AI Teamwork], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [N], [Y], [N], [Y], [Y], [10.0],
    [12], [From Human-to-Human to Human-to-Bot Conversations in Software Engineering], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [N], [N], [Y], [Y], [10.0],
    [13], [From Prompting to Verification: How Experience Shapes Vibe Coding Practices], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [14], [From Disruptions to Discussions: How GenAI Impacts Human Interactions in Software Development], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [15], [Generative AI for software architecture. Applications, challenges, and future directions], [Y], [Y], [P], [P], [P], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [10.5],
    [16], [Generative AI in Software Development: Challenges, Opportunities, and New Paradigms for Quality Assurance], [Y], [P], [P], [Y], [P], [Y], [Y], [N], [Y], [N], [P], [Y], [8.0],
    [17], [How Do Developers Interact with AI? An Exploratory Study on Modeling Developer Programming Behavior], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [18], [LLMs' reshaping of people, processes, products, and society in software development: a qualitative exploration with early adopters], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [19], [One Developer Is All You Need: A Case Study of an AI-Augmented One-Person Squad in a Brownfield Enterprise], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [20], [Reframing Software Architecture and Design Skills in the Era of Generative Artificial Intelligence], [Y], [N], [N], [N], [N], [N], [N], [N], [N], [N], [N], [N], [1.0],
    [21], [Rethinking Software Engineering for Agentic AI Systems], [Y], [Y], [P], [N], [P], [Y], [Y], [P], [Y], [Y], [Y], [Y], [9.5],
    [22], [SDAD: Spec-Driven Agentic Development for the AI-Native SDLC], [Y], [Y], [P], [P], [N], [N], [Y], [P], [Y], [Y], [Y], [Y], [8.5],
    [23], [Software Engineering by and for Humans in an AI Era], [Y], [Y], [Y], [N], [N], [N], [Y], [N], [Y], [N], [Y], [Y], [7.0],
    [24], [The Impact of Modern AI on Software Development: A Systematic Literature Review], [Y], [Y], [P], [P], [P], [Y], [Y], [P], [Y], [N], [Y], [Y], [9.0],
    [25], [The role of LLMs in Collaborative Software Design], [], [], [], [], [], [], [], [], [], [], [], [], [],
    [26], [The Role of Software Engineering Knowledge in Shaping Effective AI-Driven Development], [], [], [], [], [], [], [], [], [], [], [], [], [],
    [27], [Using LLMs in Software Design: An Empirical Study of GitHub and A Practitioner Survey], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [Y], [12.0],
    [28], [Vibe Coding as a Reconfiguration of Intent Mediation in Software Development: Definition, Implications, and Research Agenda], [Y], [Y], [P], [N], [N], [P], [P], [N], [Y], [P], [Y], [Y], [6.0],
    [29], [What Will Remain Human in Software Architecture? A Focus Group Report], [Y], [Y], [Y], [N], [Y], [Y], [Y], [N], [Y], [Y], [Y], [Y], [10.0],
    [30], [When Clean Code Becomes Costly: Balancing Human Readability and AI Digestibility with the NUDEE Framework], [Y], [Y], [N], [N], [N], [Y], [Y], [P], [Y], [Y], [Y], [Y], [8.5],
  ),
  caption: [Evaluación de la calidad QA],
)

== Análisis de datos

Los resultados posteriores al proceso de búsqueda con criterios de inclusión y exclusión y evaluación de la calidad se obtuvieron los siguientes resultados. En la @grafica-1 se observa el número de artículos obtenidos entre los años 2024 y 2026, distinguiendo cada base de datos por color. Aunque de acuerdo al criterio de inclusión 1 la búsqueda incluía artículos entre 2020 y 2026 se encontraron relevantes fuentes en los últimos 3 años. En el año 2026 fueron publicados más artículos relevantes, lo cual indica que los estudios relacionados con marcos de trabajo con integración de inteligencia artificial son cada vez más relevantes.

#figure(
  image("../images/Figura1.png", width: 5.5in),
  caption: [Número de artículos por año]
) <grafica-1>

En la @grafica-2 se observa la proporción de artículos según el tipo de investigación por tipo de datos empleados. La mayoría de estudios fueron de tipo mixto y el resto fueron investigaciones cualitativas. Esto significa que las investigaciones cualitativas no se realizaron de manera empírica sino con un enfoque exploratorio en estudios previos.

#figure(
  image("../images/Figura2.png", width: 5.5in),
  caption: [Tipos de investigación en fuentes primarias]
) <grafica-2>

En la @grafica-3 se muestra la proporción de artículos que presentan una propuesta de marco de trabajo, flujo o proceso para la ingeniería de software con IA. La mayoría de estudios se mantienen en la línea de evaluación, estudio de caso o revisión de literatura. El menor porcentaje corresponde a artículos que presentan una propuesta y la evalúan empíricamente.

#figure(
  image("../images/Figura3.png", width: 5.5in),
  caption: [Proporción de estudios que proponen marcos de trabajo]
) <grafica-3>

= Resultados

*Si el desarrollo se lleva a cabo con el uso de agentes de IA, ¿cuáles son las metodologías de trabajo y procesos que resultan más efectivos para optimizar el desarrollo?*

#show figure.where(kind: table): set block(breakable: true)

#figure(
  table(
    columns: (auto, 1fr),
    align: (top + left, top + left),
    stroke: 0.5pt,

    // Encabezado que se repite en cada página si la tabla se extiende
    table.header(
      [*Autor*], [*Respuesta*]
    ),

    // Filas de datos
    [#cite(label("10.1145/3832783.3834536"), form: "prose")], [Evalúan una metodología propuesta denominada Command Coding que requiere habilidades nivel senior en arquitectura. La metodología fue evaluada en el desarrollo de la librería all2md; el proyecto fue completado en 41 días de trabajo y se estima que acelerar el trabajo entre 25 y 40 veces el ritmo de trabajo en comparación con el desarrollo tradicional sin pérdida de la calidad. Esto se logra mediante sprints pequeños diarios que desarrollan de 3 a 5 elementos de trabajo.],

    [#cite(<article>, form: "prose")], [Evaluaron una metodología enfocada en la interacción humano-IA denominada Collaborative Iterative Co-Authoring Process (CICAP). Se evaluó este marco de trabajo en el desarrollo de un plugin para la plataforma Moodle y se observó una reducción del 60% del tiempo total estimado del proyecto. El flujo de trabajo consta de 6 etapas que incluye la documentación final de los prompts y su respuesta para la reproducibilidad y aprendizajes en proyectos futuros.],

    [#cite(<boas2026developerneedcasestudy>, form: "prose")], [Presentan la metodología Specification-Driven Development (SDD) como un paradigma emergente en el desarrollo asistido por IA. Esta metodología se fundamenta en el desarrollo dirigido por pruebas y el objetivo principal es generar especificaciones que un agente de IA pueda implementar sin ambigüedad. En este caso, los autores evalúan el desarrollo de una plataforma de firma digital para un banco en el que un solo desarrollador configura los roles de varios agentes (Product Manager, Specification y Developers).],
  ),
  caption: [Metodologías de trabajo de desarrollo asistido por IA],
) <tabla-pregunta-1>

*¿Cuáles son las prácticas de los ingenieros de software en el diseño arquitectónico de sistemas cuando el proceso de desarrollo es dirigido por IA?*

#show figure.where(kind: table): set block(breakable: true)

#figure(
  table(
    columns: (auto, 1fr),
    align: (top + left, top + left),
    stroke: 0.5pt,

    // Encabezado que se repite si la tabla se extiende a otra página
    table.header(
      [*Autor*], [*Respuesta*]
    ),

    // Filas de datos
    [#cite(<wang2026usingllmssoftwaredesign>, form: "prose")], [Con base en una encuesta, se ha observado que los LLMs se han utilizado para actividades de diseño de alto nivel, descomposición modular, estructura organizacional, pros y contras, así como patrones de interacción y coordinación.],

    [#cite(label("10.1145/3803291.3803317"), form: "prose")], [Indica que los ingenieros deben guiar a la IA para definir esquemas de datos y estructurar arquitecturas multicapa, de otra manera la IA genera componentes aislados que difícilmente pueden integrarse, esquemas con falta de coherencia y mecanismo de seguridad deficientes.],

    [#cite(<vanheesch2026remainhumansoftwarearchitecture>, form: "prose")], [Resalta la importancia que tiene la especificación previo a la implementación por parte de agentes de IA, puesto que la calidad de la salida es directamente proporcional a la precisión de la entrada especificada. Así lo han reportado participantes en encuestas. También señala que algunos usuarios prefieren implementar algunas características de manera independiente para que el agente aprenda de manera más rápida el estilo del código.],

    [#cite(<11575292>, form: "prose")], [
      Método de Attribute Driven Design: utiliza el método de arquitectura Architecture-Driven Design (ADD), esto es descomponer el diseño arquitectónico en pasos secuenciales para generar artefactos intermedios en el proceso.

      Definición de rol: configurar el perfil del LLM como arquitecto sénior que justifica cada propuesta por atributo de calidad, así como la evaluación de ventajas y desventajas.

      Architectural drivers: proporcionar los drivers arquitectónicos como entradas al LLM que incluyen requisitos funcionales primarios, escenarios de atributos de calidad, restricciones y decisiones arquitectónicas. Estos artefactos deben ser prioritarios.
    ],

    [#cite(<klatt2026asawagenticsoftwarearchitecture>, form: "prose")], [Propone Agentic-Software Architecture Workflow (A-SAW) como un flujo de trabajo de tres capas (Artifact, Agent Orchestration, Human Review) para crear artefactos de arquitectura y reducir el esfuerzo de mantenerlos actualizados en las iteraciones del ciclo de vida del software.],
  ),
  caption: [Prácticas de diseño arquitectónico asistido por IA],
) <tabla-pregunta-2>

*¿Cómo se estructuran las etapas del ciclo de vida de software con la integración de IA?*

#show figure.where(kind: table): set block(breakable: true)

#figure(
  table(
    columns: (auto, 1fr),
    align: (top + left, top + left),
    stroke: 0.5pt,

    // Encabezado que se repite si la tabla se extiende a otra página
    table.header(
      [*Autor*], [*Respuesta*]
    ),

    // Filas de datos
    [#cite(<Tabarsi_2026>, form: "prose")], [
      Declara que los LLMs influyen en 5 fases del ciclo de vida del software. Se percibe que:
      
      - *Requisitos:* menor adopción de IA.
      - *Diseño:* uso de LLMs para la descomposición del problema.
      - *Implementación:* uso de estrategias de prompts sofisticadas.
      - *Pruebas y revisión de código:* pruebas unitarias con limitaciones.
      - *Debugging, refactorización y documentación:* el uso de LLMs reduce el tiempo de debugging.
    ],

    [#cite(<11052848>, form: "prose")], [El ciclo de vida se puede estructurar en 4 fases integradas: la planificación y diseño que incluye la recolección de requisitos, arquitectura y prototipado; la implementación que abarca autocodificación, depuración y control de precisión; las pruebas generadas con IA y el despliegue y optimización que incluye la configuración de pipelines CI/CD, monitoreo e ingeniería financiar para gestionar costos computacionales.],

    [#cite(<11499432>, form: "prose")], [El proceso de software se extiende previo a los requisitos de un proyecto. En este caso, la Ideación comienza desde la adopción de una IA generativa: identificar las ideas de negocio, inquirir en modelos de IA, probar prompts de prueba y la selección de modelos. Las siguientes etapas del ciclo de vida corresponden al desarrollo, y son bastante apegadas al modelo tradicional: requisitos, desarrollo, pruebas y validación. El último gran apartado es la Operación: despliegue, monitoreo, evaluar tiempo de ejecución y mejora de la aplicación. Siempre es posible volver entre cada gran apartado, por ejemplo para cambiar de modelo de IA o para ampliar el desarrollo.],
  ),
  caption: [Etapas del ciclo de vida del software integrando IA],
) <tabla-pregunta-3>

*¿De qué manera la integración de la IA generativa redefine la comunicación técnica, el pensamiento crítico y las dinámicas de colaboración en los equipos de desarrollo de software?*

#show figure.where(kind: table): set block(breakable: true)

#figure(
  table(
    columns: (auto, 1fr),
    align: (top + left, top + left),
    stroke: 0.5pt,

    // Encabezado que se repite automáticamente si la tabla pasa a otra página
    table.header(
      [*Autor*], [*Respuesta*]
    ),

    // Filas de datos
    [#cite(<boas2026developerneedcasestudy>, form: "prose")], [
      Sugiere que la inteligencia artificial maximiza la tendencia de reducción de equipos de trabajo que requieren mayor coordinación, pero que disminuye la especialización que ocupa cada miembro. Mediante el uso de agentes de IA, un ingeniero puede trabajar sin sufrir la carga cognitiva de un equipo de trabajo y con los beneficios de las capacidades de un equipo de trabajo, asignando un rol a múltiples agentes de IA.

      En este caso, se estructuran tres roles durante el ciclo de vida:

      - *Product manager:* agente configurado con conocimiento del dominio del problema.
      - *Agente de especificaciones:* con acceso a repositorios, microservicios, componentes, etc.
      - *Desarrolladores:* divididos entre módulos críticos, como reglas de negocio y casos de uso, y módulos no críticos como integración de APIs, configuración de cola de mensajes y código boilerplate.
    ],

    [#cite(label("10.1145/3808120"), form: "prose")], [Aumenta el escepticismo de los desarrolladores con el uso de código generado por IA. Prefieren utilizar sólo porciones de código y escribir el resto manualmente porque es más fácil la verificación posterior.],

    [#cite(<Cynthia_2026>, form: "prose")], [Cuando se trata de la revisión de integraciones de código por medio de pull requests, se ha encontrado que los desarrolladores principales tienden a priorizar soluciones alternativas frente a los problemas relacionados con código generado mientras que los desarrolladores secundarios se enfocan en la organización del código.],

    [#cite(<11363384>, form: "prose")], [Los desarrolladores Sénior prefieren que los desarrolladores novatos utilicen IA para responder preguntas triviales o rutinarias, y reservar las preguntas que requieren discusión y múltiples puntos de vista bajo la guía humana. Ante esto, los novatos declaran que esta dinámica resulta cómoda cuando se trata de preguntas que les apena consultar con los superiores. En este sentido, es importante la habilidad de delegar preguntas a la IA generativa para mantener la concentración en las tareas inmediatas y el ritmo de trabajo. Como resultado, se reportó un 59% de mejoría en los tiempos de las actividades y además algunos desarrolladores dicen haber incrementado la confianza en las soluciones.],

    [#cite(<khojah2024humantohumanhumantobotconversationssoftware>, form: "prose")], [Declara que la comunicación humano-humano asume un contexto explícito e implícito compartido por el equipo, mientras que las comunicación con LLMs requiere personalización para la comprensión del problema.],

    [#cite(label("10.1145/3803437.3806702"), form: "prose")], [Al trabajar en parejas (pair-programming), se han encontrado tres patrones diferentes del uso de LLMs en las actividades. Los pares pueden elegir trabajar con un LLM compartido donde un desarrollador dirige y escribe los prompts y el segundo contribuye a construir y revisar la respuesta. La segunda forma de trabajo es utilizar dos instancias de LLM para una misma actividad; este enfoque permite explorar las capacidades no determinísticas de la IA pero puede causar problemas de desviación de contexto. Adicionalmente, los desarrolladores pueden separar las actividades en subactividades para cada quien trabajar en su propia instancia; este modo de trabajo requiere mayor coordinación para asegurar la coherencia.],
  ),
  caption: [Impacto de la IA en la comunicación, colaboración y roles de los equipos],
) <tabla-pregunta-4>

*¿Qué prácticas de validación y aseguramiento de la calidad emplean los ingenieros de software para mitigar los riesgos del código generado por agentes de IA?*

#show figure.where(kind: table): set block(breakable: true)

#figure(
  table(
    columns: (auto, 1fr),
    align: (top + left, top + left),
    stroke: 0.5pt,

    // Encabezado repetible en cada página
    table.header(
      [*Autor*], [*Respuesta*]
    ),

    // Filas de datos
    [#cite(label("10.1145/3832783.3834536"), form: "prose")], [
      En la metodología de Command Coding la revisión es continua y tiene tres escenarios:

      - *Filtros automáticos de seguridad:* se ejecuta en cada commit el código, tipado, ejecución pruebas y escaneo de calidad.
      - *Revisión entre modelos:* cada 3-5 elementos de trabajo un modelo diferente del que genera el código revisa el código, vulnerabilidades, consistencia de patrones y que sea coherente con la arquitectura.
      - *Revisión humana:* la revisión de humanos se enfoca en elementos críticos de seguridad, decisiones en el diseño de APIs, alineación con la arquitectura y adecuación de pruebas.
    ],

    [#cite(label("10.1016/j.infsof.2025.107751"), form: "prose")], [El uso de IA generativa también puede utilizarse para la escritura de pruebas unitarias específicas pero también para la verificación de código recién escrito para encontrar errores lógicos, vulnerabilidades o casos de refactorización.],

    [#cite(label("10.1145/3772318.3790850"), form: "prose")], [Menciona además que los desarrolladores suelen solicitar explicaciones de las modificaciones de múltiples archivos, examinar diferencias de código y solicitar revisiones ante la sobre-generación de archivos o fallos.],

    [#cite(<fawzy2026promptingverificationexperienceshapes>, form: "prose")], [Agrega que los desarrolladores experimentados suelen optar por la corrección manual antes que pedirle a la IA que corrija su propio código.],

    [#cite(label("10.1145/3702987"), form: "prose")], [Para las evaluaciones, propone casos de prueba técnicos basados en criterios de aceptación que utilizan lenguaje Gherkin.],
  ),
  caption: [Prácticas de validación y aseguramiento de la calidad del código generado por IA],
) <tabla-pregunta-5>

= Conclusiones

Finalmente, tras completar el proceso de búsqueda y recuperar información de los artículos seleccionados se pueden obtener las siguientes conclusiones respecto al ciclo de vida, marcos de trabajo y prácticas de los ingenieros de software al utilizar IA en los proyectos de desarrollo de software. En el diseño arquitectónico, los hallazgos muestran que la IA actúa como un facilitador para actividades de alto nivel y estructuración modular, aunque exige que los ingenieros asuman un rol riguroso de guía para evitar inconsistencias y componentes aislados; la aplicación de métodos estructurados como Attribute-Driven Design (ADD) y flujos como A-SAW resulta clave para priorizar atributos de calidad y mantener artefactos actualizados.

Respecto a las metodologías de trabajo y procesos más efectivos, marcos emergentes como Command Coding, CICAP y Specification-Driven Development (SDD) han demostrado optimizar drásticamente el ritmo de desarrollo y la aceleración de entrega, reduciendo tiempos hasta en un 60%. En las etapas del ciclo de vida del software, la adopción de IA engloba la ideación temprana, formulación de requisitos, despliegue, depuración y monitoreo continuo.

Por su parte, las dinámicas de colaboración y comunicación técnica han cambiado hacia modelos de interacción humano-bot, permitiendo la reducción en el tamaño de los equipos sin perder alcance de especialización entre miembros de un equipo, además se modifican las prácticas de pair-programming y la delegación de tareas rutinarias a la IA para priorizar el pensamiento crítico humano.

Finalmente, el aseguramiento de la calidad y la mitigación de riesgos asociados al código generado demandan un enfoque de validación en múltiples capas: filtros automáticos de seguridad en CI/CD, revisiones cruzadas entre distintos modelos de lenguaje y la supervisión humana experta enfocada en componentes críticos de arquitectura y seguridad. De esta manera, el nuevo paradigma promueve una ingeniería de software donde el valor principal del profesional radica en la especificación, verificación y dirección estratégica del sistema.

= Recomendaciones

Para el desarrollo de esta Revisión Sistemática de Literatura se tomaron en cuenta las bases de datos IEEE, ACM, Scopus, Science Direct y Arxiv. Para el tema presentado en esta investigación la literatura gris no queda fuera del alcance, puesto que de acuerdo a las tendencias observadas en el análisis de datos la información respecto a metodologías es reciente, y Arxiv es una excelente herramienta para buscar información actualizada.

// Referencias
#pagebreak()

#bibliography("../references.bib", style: "apa")
