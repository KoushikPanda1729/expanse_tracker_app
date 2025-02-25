package routes

import (
	controller "expanse-tracker/controllers"

	"github.com/gin-gonic/gin"
)

func IncomeExpanseRouter(incomingRoutes *gin.Engine) {
	incomingRoutes.POST("/add-expanse", controller.AddIncome())

}
