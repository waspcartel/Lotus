package keeper

import (
	"github.com/babyblockchains/baby/x/baby/types"
)

var _ types.QueryServer = Keeper{}
