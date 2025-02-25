package controllers

import (
	"context"
	"expanse-tracker/db"
	"expanse-tracker/models"
	"expanse-tracker/utils"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
)

var incomeExpanseCollection *mongo.Collection = db.OpenCollection(db.Client, "income-expanse")

func AddIncome() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()

		var incomeExpanse models.IncomeExpanse

		if err := c.ShouldBindJSON(&incomeExpanse); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}
		validate := validator.New()

		validate.RegisterValidation("account_type", utils.ValidateAccountType)
		validate.RegisterValidation("bank_name", utils.ValidateBankName)
		validate.RegisterValidation("category", utils.ValidateCategory)

		validationError := validate.Struct(incomeExpanse)

		if validationError != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": validationError.Error()})
			return
		}

		incomeExpanse.Id = primitive.NewObjectID()

		_, err := incomeExpanseCollection.InsertOne(ctx, incomeExpanse)

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, gin.H{"message": "account added successfully", "incomeExpanse": incomeExpanse})

	}
}

func GetTotalIncome() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func AddExpanse() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func GetTotalExpanse() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func GetTransactionByDay() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func GetTransactionByMonth() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}

func GetExpanses() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}
func GetExpansesByMonth() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}
func GetIncomes() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}
func GetIncomesByMonth() gin.HandlerFunc {
	return func(c *gin.Context) {

	}
}
