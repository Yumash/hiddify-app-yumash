package tls

import (
	"math/rand"
	"strings"
	"unicode"
)

// RandomizeSNICase randomizes the case of each character in the SNI
// This helps bypass DPI systems that use case-sensitive string matching
// Example: "google.com" -> "GoOgLe.CoM"
func RandomizeSNICase(sni string) string {
	if sni == "" {
		return sni
	}

	var result strings.Builder
	result.Grow(len(sni))

	for _, c := range sni {
		if unicode.IsLetter(c) {
			if rand.Intn(2) == 0 {
				result.WriteRune(unicode.ToUpper(c))
			} else {
				result.WriteRune(unicode.ToLower(c))
			}
		} else {
			result.WriteRune(c)
		}
	}

	return result.String()
}
