/*
purpose : balance right subtree (RR rotation/RL rotation)
input : treePointer *parent, int *unbalanced
output : none
*/
void rightRotation(treePointer *parent, int *unbalanced)
{
	treePointer grandChild, child;
	child = (*parent)->rightChild;
	if (child->bf == -1)
	{
		// RR rotation
		(*parent)->rightChild = child->leftChild;
		child->leftChild = *parent;
		(*parent)->bf = 0;
		(*parent) = child;
	}
	else
	{
		// RL rotation
		grandChild = child->leftChild;
		child->leftChild = grandChild->rightChild;
		grandChild->rightChild = child;
		(*parent)->rightChild = grandChild->leftChild;
		grandChild->leftChild = *parent;

		switch (grandChild->bf)
		{
		case 1:
			(*parent)->bf = 0;
			child->bf = -1;
			break;
		case 0:
			(*parent)->bf = child->bf = 0;
			break;
		case -1:
			(*parent)->bf = 1;
			child->bf = 0;
			break;
		}
		*parent = grandChild;
	}
	(*parent)->bf = 0;
	*unbalanced = FALSE;
}
