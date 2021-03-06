package net.unicoen.node;

import java.util.List;
import net.unicoen.node_helper.*;

/** 関数/メソッド呼び出し */
public class UniMethodCall extends UniExpr {
	public UniExpr receiver;
	public String methodName;
	public List<UniExpr> args;

	public UniMethodCall() {
	}

	public UniMethodCall(UniExpr receiver, String methodName, List<UniExpr> args) {
		this.receiver = receiver;
		this.methodName = methodName;
		this.args = args;
	}

	@Override
	public String toString() {
		return "MethodCall(" + methodName + ")";
	}

	@Override
	public int hashCode() {
		int result = 17;
		result = result * 31 + (receiver == null ? 0 : receiver.hashCode());
		result = result * 31 + (methodName == null ? 0 : methodName.hashCode());
		result = result * 31 + (args == null ? 0 : args.hashCode());
		result = result * 31 + (comments == null ? 0 : comments.hashCode());
		result = result * 31 + (codeRange == null ? 0 : codeRange.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof UniMethodCall)) return false;
		UniMethodCall that = (UniMethodCall)obj;
		return (this.receiver == null ? that.receiver == null : this.receiver.equals(that.receiver))
			&& (this.methodName == null ? that.methodName == null : this.methodName.equals(that.methodName))
			&& (this.args == null ? that.args == null : this.args.equals(that.args))
			&& (this.comments == null ? that.comments == null : this.comments.equals(that.comments))
			&& (this.codeRange == null ? that.codeRange == null : this.codeRange.equals(that.codeRange));
	}

	@Override
	public boolean isStatement() {
		return false;
	}

	public void merge(UniMethodCall that) {
		if (that.receiver != null) {
			this.receiver = that.receiver;
		}
		if (that.methodName != null) {
			this.methodName = that.methodName;
		}
		if (that.args != null) {
			if (this.args == null) {
				this.args = that.args;
			} else {
				this.args.addAll(that.args);
			}
		}
		if (that.comments != null) {
			if (this.comments == null) {
				this.comments = that.comments;
			} else {
				this.comments.addAll(that.comments);
			}
		}
		if (that.codeRange != null) {
			this.codeRange = that.codeRange;
		}
	}
}
