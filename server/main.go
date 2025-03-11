package main

import (
	"expanse-tracker/db"
	"expanse-tracker/middlewares"
	"expanse-tracker/routes"
	"log"
	"os"
	"time"

	"github.com/gin-contrib/cors"
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
	r := gin.Default()

	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Authorization", "Content-Type"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		MaxAge:           12 * time.Hour,
	}))

	router := gin.New()
	router.Use(gin.Logger())
	routes.UserRoutes(router)
	routes.EmailRouter(router)
	routes.GoogleAuth(router)
	router.Use(middlewares.Authentication())
	routes.AccountRouter(router)
	routes.IncomeExpanseRouter(router)
	routes.BudgetRouter(router)

	router.Run(":" + port)

}
