--Type unions, means either of them.
type Scale = Normal | Logarithmic

type Widget
    = ScatterPlot (List (Int, Int))
    | LogData (List String)
    | TimePlot (List (Time, Int))


view : Widget -> Element
view widget =
    case widget of
      ScatterPlot points ->
          viewScatterPlot points

      LogData logs ->
          flow down (map viewLog logs)

      TimePlot occurances ->
          viewTimePlot occurances




