dataFabric = softwaresystem "Int2 Fabric" "Autonomous Bigdata Platform has been powerd by Intellectu's Data Fabric Platform which contains the data virtualizations to manage data and the semantic search to discover and the data pipelines to make automated workflows." "Int2 Data Fabric" {

 properties {
     "Owner" "intellectus.software"
 }   
 group "Client-side" {
     jotter = container "Web Application" "Serverless nextjs" {
         tags "Web Browser"
     }
  }
  group "Backend Services" {
     group "API Service" {
         fabricApiProvider = container "API Service" "API Gateway Managed Service"
     }
     group "Knowledge Service" {
         knowledgeSlipbox = container "Knowledge Graph App" "Provides" "Container: Serverless Java or Typescript Application" {
             knowledgeWeaver = component "Knowledge Weaver" "Knowledge Weaver"
             knowledgeSlipboxApiProvider = component "Knowledge Slipbox Api Provider" "Knowledge Graph"
         }
         knowledgeGraphDatabase = container "Knowledge Graph Database" "DB: Neo4j or AWS Neptune" {
             tags "Database" "Graph Database"
         }
     }
     group "Metadata Service" {
         activeMetadata = container "Metadata App" "Active Metadata" {
             tags "Active Metadata"
             metaGin = component "Meta Gin" "Metadata Analyzer" "Component: Spring bean" {
                 tags "Active Metadata" 
             }
             oddSpecification = component "Data Catalog Builder" "Component: Spring bean" {
                 tags "Active Metadata"
             }
             fabricDataCatalog = component "Fabric Data Catalog" "Component: Spring bean" {
                 tags "Active Metadata"
             }
         }
         
         activeMetadataDb = container "Metadata Database" "DB: AWS Aurora Postgrsql" {
             tags "Database" "Active Metadata"
         }
     }
     
     group "DataPipelineService" {
         streamApi = container "Stream API" "Subscribe data to store" "Container: Zenoh Backend S3"
         streamRouter = container "Stream Router" "Router" "Container: Zenoh Router"
         streamObjectStorage = container "Stream Object Storage" "Raw data storage" "AWS S3" {
             tags "Database"
         }
         streamDatabase = container "Stream Database" "Database" "InfluxDB(Amazon Timestream)" {
             tags "Database"
         }
         streamClient = container "Stream Client to pub/sub" "Message Broker" "Zenoh Router mode" {
             tags "DataPipelineService"
         }

         streamApi -> streamRouter "subscribe data to store" 
         streamApi -> streamObjectStorage
         streamClient -> streamDatabase

         streamClient -> streamRouter
         
        fabricBroker = container "Data Source Gateway" "Manage data pipeline between distburited data source and Data Fabric in secure." "Container: Java Application"
    }

    # relationships between API Service <> DataPipelineService
    streamApi -> fabricApiProvider

  }
}