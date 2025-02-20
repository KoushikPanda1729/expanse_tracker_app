package controllers

import (
	"context"
	"expanse-tracker/db"
	"expanse-tracker/models"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
)

var accountCollection *mongo.Collection = db.OpenCollection(db.Client, "accounts")

func AddAccount() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()
		var account models.Account

		if err := c.ShouldBindJSON(&account); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		validationError := validate.Struct(account)
		if validationError != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": validationError.Error()})
			return
		}

		account.ID = primitive.NewObjectID()

		_, err := accountCollection.InsertOne(ctx, account)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to insert account"})
			return
		}
		c.JSON(http.StatusOK, gin.H{"message": "account added successfully", "account": account})

	}
}

func DeleteAccount() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()

		accountID := c.Param("account_id")
		objID, err := primitive.ObjectIDFromHex(accountID)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid account ID"})
			return
		}
		filter := bson.M{"_id": objID}

		result, err := accountCollection.DeleteOne(ctx, filter)

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Error occurred while deleting the account"})
			return
		}

		if result.DeletedCount == 0 {
			c.JSON(http.StatusNotFound, gin.H{"error": "Account not found"})
			return
		}
		c.JSON(http.StatusOK, gin.H{"message": "Account deleted successfully"})

	}
}
