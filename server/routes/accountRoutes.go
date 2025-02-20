package routes

import (
	controller "expanse-tracker/controllers"

	"github.com/gin-gonic/gin"
)

func AccountRouter(incomingRoutes *gin.Engine) {
	incomingRoutes.POST("/add-account", controller.AddAccount())
	incomingRoutes.POST("/delete-account/:account_id", controller.DeleteAccount())
}
