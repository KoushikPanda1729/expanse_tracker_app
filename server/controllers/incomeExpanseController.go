package controllers

import (
	"expanse-tracker/db"

	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/mongo"
)

var incomeExpanseCollection *mongo.Collection = db.OpenCollection(db.Client, "income-expanse")

func addIncome() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func getTotalIncome() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func addExpanse() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func getTotalExpanse() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func getTransactionByDay() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func getTransactionByMonth() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func getExpanses() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}
func getExpansesByMonth() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}
func getIncomes() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}
func getIncomesByMonth() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}
