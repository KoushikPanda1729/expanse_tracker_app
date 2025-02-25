package models

import (
	"time"

	"go.mongodb.org/mongo-driver/bson/primitive"
)

type Category string

const (
	Subscription  Category = "Subscription"
	Shopping      Category = "Shopping"
	Rent          Category = "Rent"
	Food          Category = "Food"
	Tranportation Category = "Transportation"
	Health        Category = "Health"
	Insurance     Category = "Insurance"
)

type IncomeExpanse struct {
	Id             primitive.ObjectID `json:"_id" bson:"_id"`
	Amount         int64              `json:"amount"`
	Category       Category           `json:"category" validate="category"`
	Description    *string            `json:"description"`
	AccountType    AccountType        `json:"account_type" validate:"account_type"`
	BankName       *BankName          `json:"bank_name" validate:"bank_name"`
	Repeat         bool               `json:"repeat"`
	Attachment     *string            `json:"attachment"`
	Transaction_Id string             `json:"transaction_id,omitempty"`
	Frequency      *time.Time         `json:"frequncy"`
	End_after      *time.Time         `json:"end_after"`
	Created_Date   primitive.DateTime `json:"created_date"`
	Updated_Date   primitive.DateTime `json:"updated_date"`
}
