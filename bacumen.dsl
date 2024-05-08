bacumen = softwaresystem "Bacumen" "Business Acumen provides a visualization to act for the business sucess."  {
    properties {
         "Owner" "intellectus.software"
    }   

     group "API" {
        bacumenApi = container "API Service" "Server"

    }
    group "Dashboard" {
        bacumenVisualizationPanel = container "VisualizationPanel" "Server"
    }
}