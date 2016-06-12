library(shiny)
ui <- fluidPage(
        
                headerPanel('Alison Hawthorne Project'),
                br(),
                h2("Body Mass Index Analysis"),
                
                sidebarPanel(
                        ##attain input values to calculate BMI
                        radioButtons("pick1", "How would you like to enter your weight?", 
                                     c("Kilos (Kg)" = "kg", "Pounds (Lb)" = "lb", "None Selected" = "none"),
                                     selected = "none"),
                        
                        conditionalPanel(
                                condition = "input.pick1 == 'kg'",
                                numericInput("w", "Enter your weight in kg", min = 30, max = 300, value = 70)),
                        conditionalPanel(
                                condition = "input.pick1 == 'lb'",
                                numericInput("l", "Enter your weight in lb", min = 60, max = 500, value = 150)
                        ),
                        br(),
                        
                        radioButtons("pick2", "How would you like to enter your height?", 
                                     c("Centimetres (Cm)" = "cm", "Inches (In)" = "in", "None Selected" = "none"),
                                     selected = "none"),
                        
                        conditionalPanel(
                                condition = "input.pick2 == 'cm'",
                                numericInput("h", "Enter your height in centimetres", min = 80, max = 240, value = 165)
                        ),
                        conditionalPanel(
                                condition = "input.pick2 == 'in'",
                                numericInput("i", "Enter your height in inches", min = 36, max = 90, value = 66)
                        ),
                        br(),
                        radioButtons("rad", "Would you like to see a graph?", c("Yes Please" = "Y", "No thanks" = "N"),
                                     selected = "N"),
                        br()
                ),
                mainPanel(
                        ##present BMI calculation
                        p("Body mass index (BMI) is measure of body fat based on height and weight. The higher the BMI, the greater the risk of some diseases, including high blood pressure, coronary artery disease, stroke, osteoarthritis, some cancers, and type 2 diabetes."),
                        h3('For a Body Mass Index of:'),
                        verbatimTextOutput("nText"),
                        h3('This value of BMI suggests the person may be:'),
                        verbatimTextOutput("nRad"),
                        br()
                ),

                conditionalPanel(
                        condition = "input.rad == 'Y'",
                        ##if the user selects the graph, present the BMI graph
                        h3("A graph of the BMIs of 2107 people from 2013"),
                        h4("Selected BMI is marked in the sample in red for Comparison to Sample"),
                        plotOutput("bmi")
                )
)
