Review

Reviewed by: E.Seppar, J.Walsh

Review Points:

1. Do we need to version the S3 Bucket?

Yes - to track tfstate changes is useful for troubleshooting so I think we should.

2. Change name of variables in variables.tf file to be project-bucket-3s-a-cloud, project-table-3s-a-cloud

Complete

3. Change vpc default value to project-3s-a-cloud-vpc

Complete

4. Change cluster_name default value to project-3s-a-cloud-cluster

Complete

5. Change provider.tf so that bucket, dynamodb_table are same as in backend/variables.tf

Complete

6. Make a note to add a description of the cluster endpoint in README.md

Complete

7. Amend author name to be more verbose.

Complete

8. Amend description of teardown.sh

Complete

9. Rename teardown-all-linux.sh to teardown.sh

Complete