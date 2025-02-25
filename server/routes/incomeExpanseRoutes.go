package routes

import (
	controller "expanse-tracker/controllers"

	"github.com/gin-gonic/gin"
)

func IncomeExpanseRouter(incomingRoutes *gin.Engine) {
	incomingRoutes.POST("/add-income", controller.AddIncome())
	incomingRoutes.GET("/get-months-income", controller.GetIncomesByMonth())

}
