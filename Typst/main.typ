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

Extensión de entre 150 y 300 palabras, que describa de forma general
el contenido del documento. Cuál es el tema, importancia de abordarlo,
comentar el objetivo, el diseño: enfoque, alcance, corte, etc. Mencionar
la propuesta de técnicas e instrumentos para la investigación, entre
otros aspectos de interés. Párrafo en tipografía Times New Roman a 12
pts., con interlineado de 21 pts., sin sangría. Este es un ejemplo de
texto simulado y contiene las características de los párrafos de este
documento.

Sangría a partir del segundo párrafo, observarlo en todo el documento.
El contenido del documento debe integrarse de acuerdo con la guía
proporcionada. Debe leer con atención las indicaciones que contiene
esta plantilla, no modifique el formato que aquí se muestra, el documento
final debe corresponder totalmente con los lineamientos de formato que
aquí se explican.

En la redacción de todo el documento empleen un estilo apropiado a un
texto de carácter científico y del contexto académico. No utilicen
redacción en primera persona ni plural ni singular (presentamos, tenemos,
decimos, etc., no es correcto), prefieran redacción en tercera persona
(se presenta, se tiene, etc.), tampoco se recomienda el uso del verbo “decir”
pues al ser un trabajo escrito, no es congruente. Adicionalmente, eviten el
uso de gerundios (ejemplo: Esta situación se ha venido presentando desde…,
lo correcto es: Esta situación se presentó desde…).

Observen que esta plantilla ya tiene el formato definido para todo el
contenido del documento, no modifiquen estilo, interlineado, tipo de
letra, ni cualquier otro aspecto de formato.

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
usuario  @11645215. El software ya no es solamente un sistema de uso científico o ingenieril,
sino que se ha convertido en un producto de uso cotidiano accesible para el público general.

Por otro lado la historia de la inteligencia artificial como disciplina también ha tenido avances
cada vez más rápidos en los campos de deep learning y redes neuronales profundas. Pero fue en el
año de 2024 cuando aumentaron las herramientas y tecnologías potenciadas por asistentes de codificación
que el uso de inteligencia artificial en el desarrollo de software cobró relevancia. Los agentes de
IA ya eran capaces de interactuar con herramientas de terceros, realizar búsquedas en la web, y actuar
sobre el entorno digital, dejando de ser una herramienta secundaria a un componente activo en el
desarrollo. Para 2025, el científico Andrej Karpathy hizo uso del concepto de “Vibe Coding” para
referirse a la generación de código mediante lenguaje natural.

Como ingeniería, siempre ha sido de interés el aumentar la eficiencia en el desarrollo de proyectos.
Primariamente, las dinámicas en los equipos de trabajo, los procesos y metodologías como Scrum han
agilizado los tiempos de los proyecto, pero el uso de inteligencia artificial ha mejorado considerablemente
el ritmo de trbaajo. #cite(<11404330>, form: "prose") señalan que se han observado tiempos de desarrollo
que se reducen de meses a semanas o días al examinar los resultados del vibe coding en proyectos reales.
Los equipos de trabajo pueden dedicar más tiempo para la innovación, prototipos y lógica de negocio
debido a la automatización de generación de código.

Frente a esta situación, quienes ignoran el uso de la inteligencia artificial
se encuentran posición de desventaja para hacer frente a las necesidades del
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

#lorem(100)

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


// Referencias
#pagebreak()

#bibliography("../references.bib", style: "apa")
