﻿using System;
using System.Collections.Generic;
using System.Text;

namespace LifeBackup.Core.Communication.Bucket
{
    public class ListS3BucketsResponse
    {
        public string BucketName { get; set; }
        public DateTime CreationDate { get; set; }
    }
}
