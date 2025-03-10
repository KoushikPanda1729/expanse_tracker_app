package main

import (
	"expanse-tracker/db"
	"expanse-tracker/middlewares"
	"expanse-tracker/routes"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"go.mongodb.org/mongo-driver/mongo"
)

var userCollection *mongo.Collection = db.OpenCollection(db.Client, "user")

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	port := os.Getenv("PORT")

	if port == "" {
		port = "8000"
	}
	if err := godotenv.Load(); err != nil {
		log.Fatal("Error loading .env file")
	}
	router := gin.New()
	router.Use(gin.Logger())
	routes.UserRoutes(router)
	routes.EmailRouter(router)
	router.Use(middlewares.Authentication())
	routes.AccountRouter(router)
	routes.IncomeExpanseRouter(router)
	routes.BudgetRouter(router)

	router.Run(":" + port)

}
