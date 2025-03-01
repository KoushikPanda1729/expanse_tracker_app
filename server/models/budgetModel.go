package models

import "go.mongodb.org/mongo-driver/bson/primitive"

type Budget struct {
	Id               primitive.ObjectID `json:"_id,omitempty" bson:"_id,omitempty"`
	Category         Category           `json:"category"`
	Amount           int64              `json:"amount"`        //default 0
	Recieve_Alert    bool               `json:"receive_alert"` //default false
	Alert_Percentage *int64             `json:"alert_percentage"`
}
