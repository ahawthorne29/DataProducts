#load the libraries and data we need
library(mixsmsn)
data("bmi")


shinyServer(function(input, output) {
        
        #calculate the BMI (weight in kg divided by height in metres, divided by height again)
        #perform conversions as needed dependent on input
        output$nText <- renderText({
                if (input$pick1 == "none") {"None Selected"}
                else if (input$pick2 == "none") {"None Selected"}
                else if (input$pick1 == "kg" & input$pick2 == "cm")
                        {input$w / (input$h / 100)^2}
                else if (input$pick1 == "kg" & input$pick2 == "in")
                        {input$w / (input$i * 0.0254)^2}
                else if (input$pick1 == "lb" & input$pick2 == "in")
                        {(input$l / 2.20462) / (input$i * 0.0254)^2}
                else if (input$pick1 == "lb" & input$pick2 == "cm")
                        {(input$l / 2.20462) / (input$h / 100)^2}
                }
             )
        
        #output diagnosis of BMI as suggested by wikipedia
        #perform conversions as needed dependent on input
        output$nRad <- renderText({
                if (input$pick1 == "none") {"None Selected"}
                else if (input$pick2 == "none") {"None Selected"}
                else if (input$pick1 == "kg" & input$pick2 == "cm") 
                {
                        if (((input$w / (input$h / 100)^2)) < 18.5) {"Underweight"}
                        else if ((input$w / (input$h / 100)^2) <= 25) {"Healthy weight"}
                        else if ((input$w / (input$h / 100)^2) < 30) {"Overweight"}
                        else {"Obese"}
                }
                else if (input$pick1 == "kg" & input$pick2 == "in")
                {
                      if ((input$w / (input$i * 0.0254)^2) < 18.5) {"Underweight"}
                      else if ((input$w / (input$i * 0.0254)^2) <= 25) {"Healthy weight"}
                      else if ((input$w / (input$i * 0.0254)^2) < 30) {"Overweight"}
                      else {"Obese"}
                }
                
                else if (input$pick1 == "lb" & input$pick2 == "in")
                {
                        if (((input$l / 2.20462) / (input$i * 0.0254)^2) < 18.5) {"Underweight"}
                        else if (((input$l / 2.20462) / (input$i * 0.0254)^2) <= 25) {"Healthy weight"}
                        else if (((input$l / 2.20462) / (input$i * 0.0254)^2) < 30) {"Overweight"}
                        else {"Obese"}
                }
                
                else if (input$pick1 == "lb" & input$pick2 == "cm")
                {
                        if (((input$l / 2.20462) / (input$h / 100)^2) < 18.5) {"Underweight"}
                        else if (((input$l / 2.20462) / (input$h / 100)^2) <= 25) {"Healthy weight"}
                        else if (((input$l / 2.20462) / (input$h / 100)^2) < 30) {"Overweight"}
                        else {"Obese"}
                        
                }
                
                
        })
        
        #draw a histogram to show a sample population of BMIs
        output$bmi <- renderPlot({hist(bmi$bmi, breaks = 20, main = "BMI by number of people in Sample",
                                       xlab = "bmi", ylab = "Number of People", col="light blue")
               #add a line for the BMI selected by the user (if selected)
                if (input$pick1 == "kg" & input$pick2 == "cm")
                        {abline(v=(input$w / (input$h / 100)^2), col="red")}
                else if (input$pick1 == "kg" & input$pick2 == "in")
                        {abline(v=(input$w / (input$i * 0.0254)^2), col="red")}
                else if (input$pick1 == "lb" & input$pick2 == "in")
                        {abline(v=((input$l / 2.20462) / (input$i * 0.0254)^2), col="red")}
                else if (input$pick1 == "lb" & input$pick2 == "cm")
                        {abline(v=((input$l / 2.20462) / (input$h / 100)^2), col="red")}
                 })

})