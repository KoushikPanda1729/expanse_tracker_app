package routes

import (
	controller "expanse-tracker/controllers"

	"github.com/gin-gonic/gin"
)

func IncomeExpanseRouter(incomingRoutes *gin.Engine) {
	incomingRoutes.POST("/v1/api/income-expanse/add-income", controller.AddIncome())
	incomingRoutes.GET("/v1/api/income-expanse/get-months-income", controller.GetIncomesByMonth())

}
