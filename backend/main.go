package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.Use(func(c *gin.Context) {
		c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		c.Next()
	})
	router.GET("/api/hello", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"msg": "Hello World",
		})
	})

	router.Run(":8080")
}
