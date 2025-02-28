package controllers

import (
	"context"
	"expanse-tracker/db"
	"expanse-tracker/models"
	"expanse-tracker/utils"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"go.mongodb.org/mongo-driver/bson"
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
		incomeExpanse.Created_Date, _ = time.Parse(time.RFC3339, time.Now().Format(time.RFC3339))
		incomeExpanse.Updated_Date, _ = time.Parse(time.RFC3339, time.Now().Format(time.RFC3339))
		incomeExpanse.Id = primitive.NewObjectID()
		incomeExpanse.Type = "Income"

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
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()

		now := time.Now()

		firstDayOfMonth := time.Date(now.Year(), now.Month(), 1, 0, 0, 0, 0, now.Location())

		lastDayOfMonth := firstDayOfMonth.AddDate(0, 1, -1)

		lastDayOfMonth = time.Date(lastDayOfMonth.Year(), lastDayOfMonth.Month(), lastDayOfMonth.Day(), 23, 59, 59, 999999999, lastDayOfMonth.Location())

		filter := bson.M{
			"type": "Income",
			"created_date": bson.M{
				"$gte": firstDayOfMonth,
				"$lte": lastDayOfMonth,
			},
		}

		pipeline := []bson.M{
			{
				"$match": filter,
			},
			{
				"$group": bson.M{
					"_id":   nil,
					"total": bson.M{"$sum": "$amount"},
				},
			},
		}

		cursor, err := incomeExpanseCollection.Aggregate(ctx, pipeline)
		if err != nil {
			log.Println("Aggregation error :", err)
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to calculate total income"})
			return
		}

		var result struct {
			Total float64 `bson:"total"`
		}

		if cursor.Next(ctx) {
			if err := cursor.Decode(&result); err != nil {
				log.Println("Decode error :", err)
				c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to decode result"})
				return
			}
		} else {
			result.Total = 0
		}

		c.JSON(http.StatusOK, gin.H{
			"month":        fmt.Sprintf("%d-%02d", now.Year(), now.Month()),
			"total_income": result.Total,
		})
	}
}
