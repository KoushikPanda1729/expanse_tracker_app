package controllers

import (
	"expanse-tracker/db"

	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/mongo"
)

var budgetCollection *mongo.Collection = db.OpenCollection(db.Client, "budget")

func CreateBudget() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func UpdateBudget() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func DeleteBudget() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func GetBudgetAmount() gin.HandlerFunc {
	return func(c *gin.Context) {
	}
}

func GetRemainingAmount() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}
