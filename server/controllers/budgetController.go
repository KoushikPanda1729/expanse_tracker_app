package controllers

import (
	"context"
	"expanse-tracker/db"
	"expanse-tracker/models"
	"expanse-tracker/utils"
	"fmt"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
)

var budgetCollection *mongo.Collection = db.OpenCollection(db.Client, "budget")

func CreateBudget() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 10*time.Second)
		defer cancel()

		var budget models.Budget

		if err := c.BindJSON(&budget); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		validationErr := validate.Struct(budget)

		if validationErr != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": validationErr.Error()})
			return
		}
		validate := validator.New()
		validate.RegisterValidation("category", utils.ValidateCategory)

		budget.Created_at, _ = time.Parse(time.RFC3339, time.Now().Format(time.RFC3339))
		budget.Updated_at, _ = time.Parse(time.RFC3339, time.Now().Format(time.RFC3339))
		budget.Id = primitive.NewObjectID()
		if budget.Recieve_Alert == nil {
			defaultRecieveAlert := false
			budget.Recieve_Alert = &defaultRecieveAlert
		}
		if budget.Amount == nil {
			defaultBudgetAmount := int64(0)
			budget.Amount = &defaultBudgetAmount
		}

		if budget.Alert_Percentage == nil {
			defaultAlertPercentage := 50
			budget.Alert_Percentage = &defaultAlertPercentage
		}

		_, insertErr := budgetCollection.InsertOne(ctx, budget)

		if insertErr != nil {
			msg := fmt.Sprintf("Budget is not created")
			c.JSON(http.StatusInternalServerError, gin.H{"error": msg})
			return
		}
		c.JSON(http.StatusOK, gin.H{"status": "success", "data": budget})

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
